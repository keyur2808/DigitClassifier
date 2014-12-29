function [error]=nbc_model(Xtrain,Ttrain,X,T)

 coeff=pca(Xtrain);
 X=X*coeff(:,1:100);
 Xtrain=Xtrain*coeff(:,1:100);

a=size(19978,1);
for i=1:19978 
    a(i)=find(Ttrain(i,:));
end


model = NaiveBayes.fit(Xtrain,a);
Y = predict(model,X);

fid = fopen('classes_nbc.txt', 'wt'); 
for i=1:size(Y,1)
   fprintf(fid, '%d\n', Y-1);
end
fclose(fid);

b=zeros(size(Y,1),10);
for i=1:size(Y,1) 
    b(i,Y(i))=1;
end


count=0;
for i=1:size(T,1)
count=count+(~isequal(T(i,:),b(i,:)));
end

error=count*100/1500;
end
