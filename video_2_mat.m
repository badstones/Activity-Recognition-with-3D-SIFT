
for f=1:100
%vidobj=VideoReader(['/Users/sourabhkulhare/Documents/MATLAB/3DSIFT_CODE_v1/Small_test/v',num2str(f),'.avi']);
obj=VideoReader(['/Users/sourabhkulhare/Documents/MATLAB/3DSIFT_CODE_v1/Small_test/w',num2str(f),'.avi']);
nFrames=obj.NumberOfFrames;
nRow=obj.Height;
nColumn=obj.Width;
video3Dm=zeros(nRow,nColumn,nFrames);  
for k=1:nFrames
   im=read(obj,k);
   im=im(:,:,1);
   video3Dm(:,:,k)=im;
   %video3Dm= video3Dm./max(max(max(video3Dm)));
end
[pathstr,name,ext] = fileparts(['/Users/sourabhkulhare/Documents/MATLAB/3DSIFT_CODE_v1/w',num2str(f),'.avi']);
fout = ['/Users/sourabhkulhare/Documents/MATLAB/3DSIFT_CODE_v1/',name,'.mat'];
save(fout,'video3Dm');
end