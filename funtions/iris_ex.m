function [accuracy,accuracy1]= iris_ex(funcaoTreino, camadas, epoca, funcCam1, funcCam2, divideFcn, trainRatio, valRatio, testRatio)
%IRIS_DATASET Summary of this function goes here
%   Detailed explanation goes here

% Carrega o dataset

structImg=load( 'imagesvectorized.mat');
structTarget=load( 'labels.mat');

matrizImagem=structImg.matrizImagem;
matrizTarget=structTarget.target;


% % CRIAR E CONFIGURAR A REDE NEURONAL
% % INDICAR: N? camadas escondidas e nos por camada escondida
% % INDICAR: Funcao de treino: {'trainlm', 'trainbfg', traingd'}
% % INDICAR: Funcoes de ativacao das camadas escondidas e de saida: {'purelin', 'logsig', 'tansig'}
% % INDICAR: Divisao dos exemplos pelos conjuntos de treino, validacao e teste
%
camadasString = camadas;
C = strsplit(camadasString);
 camadasFinal= str2double(C);
 numeroCamadas=numel(camadasFinal);
 

rede = feedforwardnet([camadasFinal]);

rede.trainFcn = funcaoTreino;
rede.trainParam.epochs = epoca;
for ii=1:numeroCamadas
    rede.layers{ii}.transferFcn = funcCam1;
end

rede.layers{numeroCamadas+1}.transferFcn = funcCam2;
if  strcmp(divideFcn,'On') && trainRatio+valRatio+testRatio==1
        rede.divideFcn = 'dividerand';
        rede.divideParam.trainRatio = trainRatio;
        rede.divideParam.valRatio = valRatio;
        rede.divideParam.testRatio = testRatio;
else
    rede.divideFcn = '';
end


% % TREINAR
[rede ,tr]= train(rede, matrizImagem, matrizTarget);

% SIMULAR
out = sim(rede, matrizImagem);
% 
% time = tr.time(:,size(tr.time,2))/60;
% time = round(time,2);
% epochs = tr.num_epochs;

%VISUALIZAR DESEMPENHO

plotconfusion(matrizTarget, out) % Matriz de confusao

 plotperf(tr)         % Grafico com o desempenho da rede nos 3 conjuntos           

%Calcula e mostra a percentagem de classificacoes corretas no total dos exemplos
r=0;
for i=1:size(out,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(matrizTarget(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end

accuracy = r/size(out,2)*100;


% SIMULAR A REDE APENAS NO CONJUNTO DE TESTE
TInput = matrizImagem(:, tr.testInd);
TTargets = matrizTarget(:, tr.testInd);

out = sim(rede, TInput);


%Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
r=0;
for i=1:size(tr.testInd,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(TTargets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end
accuracy1 = r/size(tr.testInd,2)*100;


save('lastNet.mat','rede');
save('lastTrain.mat','tr');

end
