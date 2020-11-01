function [matrizImagem, target] =uploadImageSubPasta(folderName)

myFile = folderName;

if ~isdir(myFile)
  msgErro = sprintf('Error: The following folder does not exist:\n%s', myFile);
  uiwait(warndlg(msgErro));
  return;
end

% Get list of all jpg files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
subPastas={'\A','\E','\I','\O','\U'};

numImagesFile = 0;

for jj=1:5
    folderName = strcat(myFile,subPastas{jj});
    if ~isdir(folderName)
      msgErro = sprintf('Error: The following folder does not exist:\n%s', folderName);
      uiwait(warndlg(msgErro));
      return;
    end
    filePattern = fullfile(folderName, '*.jpg');
    imageFiles = dir(filePattern);    
    filesNum = length(imageFiles);    % Number of files found
    
    numImagesFile = numImagesFile +filesNum;
    
end

numImagem = 1;

target = zeros(5,numImagesFile);

matrizImagem = zeros(784,numImagesFile);

for jj=1:5
    folderName = strcat(myFile,subPastas{jj});
    if ~isdir(folderName)
      msgErro = sprintf('Error: The following folder does not exist:\n%s', folderName);
      uiwait(warndlg(msgErro));
      return;
    end
    filePattern = fullfile(folderName, '*.jpg');
    imageFiles = dir(filePattern);    
    filesNum = length(imageFiles);    % Number of files found

    
    
    aux = 5 - jj +1;
    aux2=(jj-1)*filesNum;
    
    for ii=1:filesNum
       nomeficheiroAtual = imageFiles(ii).name;
       ficheiroAtual = fullfile(folderName, nomeficheiroAtual);
       imagemAtual = imread(ficheiroAtual);
       imagemAtualMatrizBin= imbinarize(imagemAtual);
       imagemAtualVectorBin=imagemAtualMatrizBin(:);
       
       matrizImagem(:,aux2+ii) = imagemAtualVectorBin;
       target(aux,numImagem)=1;
       numImagem=numImagem+1; 
    end
    

end






msg = sprintf('Images from file %s are ready to enter the network!',myFile);
uiwait(warndlg(msg));

save('imagesvectorized.mat','matrizImagem');

save('labels.mat','target');



end