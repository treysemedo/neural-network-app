function res= classificaDesenho(  )
nomeF='';

[file,path] = uigetfile('*.png');
if isequal(file,0)
   disp('User selected Cancel');
else
   nomeF= fullfile(path,file);
end

if exist('lastNet.mat') && exist('lastTrain.mat')
        if exist(nomeF)
            net=load('lastNet.mat');
            train=load('lastTrain.mat');
    
            rede = net.rede;
            tr = train.tr;

           imagemAtual = imread(nomeF);

           thisImage =  imresize(imagemAtual(:,:,3),[28 28]);
           imagemAtualMatrizBin= imbinarize(thisImage);
           

           imagemAtualVectorBin=imagemAtualMatrizBin(:);
            
           
           
           
           
            out = sim(rede, imagemAtualVectorBin);
            class=round(out)';
            
            
            
           if class== [0,0,0,0,1]
              res='A';
           elseif class==[0,0,0,1,0]
                res='E';
           elseif class==[0,0,1,0,0]
              res='I';
           elseif class==[0,1,0,0,0]
               res='O';
           elseif class==[1,0,0,0,0]
                res='U';
           else
              res='N/A';
            end
           
        end

end


end

