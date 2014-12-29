function[W1,W2]=train_nn(X,M,T)
W1=rand(M,size(X,2))./1000;
W2=rand(10,M)./1000;
eta=0.00043;
for i=1:58000
r = randi(size(X,1),1,1);    
z=W1*X(r,:)';
z=tanh(z);
y=exp(W2*z);
d=sum(y);
y=y./d;


deltaK=(y-T(r,:)');
W2=W2-eta*(deltaK*z');
deltaJ=zeros(M,1);
for j=1:M 
deltaJ(j)=(1-(z(j))^2)'*(W2(:,j)')*(deltaK);
end
W1=W1-eta*(deltaJ*X(r,:));
end
end