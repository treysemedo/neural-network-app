function uploadAll( )

[m1, t1]=uploadImage('Pasta_1');
[m2, t2]=uploadImageSubPasta('Pasta_2');
[m3, t3]=uploadImageSubPasta('Pasta_3');

matrizImagem=[m1,m2,m3];
target=[t1, t2, t3];



save('imagesvectorized.mat','matrizImagem');

save('labels.mat','target');



end

