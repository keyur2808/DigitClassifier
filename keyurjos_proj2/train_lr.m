function [w]=train_lr(X,T)
w=zeros(size(X,2),10);
for i=1:100:size(X,1)
est_y=exp(X*w);
for k=1:size(X,1)
   d=sum(est_y(k,:));
   est_y(k,:)=(est_y(k,:)./d);
end
err=est_y-T;
w=w-(0.0001*(X'*err));
end
end