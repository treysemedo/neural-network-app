function simular(nome)

if exist('lastNet.mat') && exist('lastTrain.mat')
    % CARREGA A REDE E O TREINO
    
    net=load('lastNet.mat');
    train=load('lastTrain.mat');
    
    rede = net.rede;
    tr = train.tr;
    
    % Carrega o dataset
    structImg=load( 'imagesvectorized.mat');
    structTarget=load( 'labels.mat');

    matrizImagem=structImg.matrizImagem;
    matrizTarget=structTarget.target;
    
    out = sim(rede, matrizImagem);
    plotconfusion(matrizTarget, out) % Matriz de confusao
end

end

