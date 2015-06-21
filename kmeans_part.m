tic;
idx200=kmeans(double(total_des),200);
signeture= zeros(300,200);
i=1;
for k=1:300
    for j=1:50
    idx=50*(k-1)+j;
    signeture(k,idx200(idx))=signeture(k,idx200(idx))+1; 
    end
end
toc;
