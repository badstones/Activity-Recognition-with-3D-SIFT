function pix=video_convertor(videoobj)
nFrames=videoobj.NumberOfFrames;  % Number of frames, time space
video3Dm=zeros();  
for k=1:nFrames
   im=read(videoobj,k);
   im=im(:,:,1);
   video3Dm(:,:,k)=im; 
end
pix=video3Dm;
end