function [Xbar,T,coeff]=load_data(input_data,calc_pca)

K=10;

fileName=strcat(input_data,'.mat');
load(fileName);
ctr=0;
for i=1:10
ctr=ctr+size(x{i},1);
end


X=zeros(ctr,size(x{1},2));
last=1;
for i=1:K
    a= x{i};
    X(last:last+size(x{i},1)-1,:)=a;
    last=last+size(x{i},1);
end

X=[ones(size(X,1),1) X];

last=1;
T=zeros(size(X,1),K);
for i=1:10
T(last:last+size(x{i},1)-1,i)=1;
 last=last+size(x{i},1);
end

Xbar=X;
coeff=0;
if (calc_pca==1)
coeff=pca(X);
Xbar=X*coeff(:,1:100);
end
end
