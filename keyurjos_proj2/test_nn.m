function [error]=test_nn(W1,W2,X,T)

z=W1*X';
z=tanh(z);
Y=exp(W2*z);
Y=Y';
for k=1:size(X,1)
   d=sum(Y(k,:));
   Y(k,:)=(Y(k,:)./d);
end

a=max(Y');


for k=1:size(Y,1)
for j=1:10
m(k,j)=(Y(k,j)==a(k));
end
end

fid = fopen('classes_nn.txt', 'wt'); 
for i=1:size(Y,1)
   fprintf(fid, '%d\n', find(m(i,:))-1);
end
fclose(fid);
    


count=0;
for i=1:size(T,1)
count=count+(~isequal(T(i,:),m(i,:)));
end



error=count*100/1500;

end
