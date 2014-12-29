function [error]=test_lr(w,Xbar,T)


Y=Xbar*w;
for k=1:size(Y,1)
   d=sum(Y(k,:));
   Y(k,:)=(Y(k,:)./d);
end

a=max(Y');


for k=1:size(Y,1)
for j=1:10
m(k,j)=(Y(k,j)==a(k));
end
end

fid = fopen('classes_lr.txt', 'wt'); 
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