function guardarRede(nome)
    
if exist('lastNet.mat')
    net=load('lastNet.mat');
    train=load('lastTrain.mat');
    
    rede=net.rede;
    tr=train.tr
    
    nomeTr = nome;
    
    nome=strcat(nome,'.mat')
    nomeTr=strcat(nomeTr,'Train.mat')
    
    save(nome,'rede');
    save(nomeTr,'tr');  
end

end
