function carregarRede()

[file,path] = uigetfile('*.mat');
if isequal(file,0)
   disp('User selected Cancel');
else
   nomeF= fullfile(path,file);
end

if exist(nomeF) 
    net=load(nomeF);
    rede = net.rede;
    save('lastNet.mat','rede');

end

end