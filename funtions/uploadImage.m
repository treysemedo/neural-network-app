function [matrizImagem,target] = uploadImage(nomePasta)

meuFicheiro = nomePasta;

if ~isdir(meuFicheiro)
  msgErro = sprintf('Error: The following folder does not exist:\n%s', meuFicheiro);
  uiwait(warndlg(msgErro));
  return ;
end

% Get list of all jpg files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.

filePattern = fullfile(meuFicheiro, '*.jpg');
ficheirosImagem = dir(filePattern);    
numFicheiros = length(ficheirosImagem);    % Number of files found


matrizImagem = zeros(784,5);
target = zeros(5,5);

for ii=1:numFicheiros
   aux = numFicheiros - ii +1;
   nomeficheiroAtual = ficheirosImagem(ii).name;
   ficheiroAtual = fullfile(meuFicheiro, nomeficheiroAtual);
   imagemAtual = imread(ficheiroAtual);
   imagemAtualMatrizBin= imbinarize(imagemAtual);
   imagemAtualVectorBin=imagemAtualMatrizBin(:);

   matrizImagem(:,ii) = imagemAtualVectorBin;
   target(ii,aux)=1;
end





save('imagesvectorized.mat','matrizImagem');

save('labels.mat','target');


 msg = sprintf('Images from file %s are ready to enter the network!!',meuFicheiro);
 uiwait(warndlg(msg));
end




 