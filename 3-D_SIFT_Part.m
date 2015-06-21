% Short demo to calculate 3DSIFT descriptors
% Short demonstration showing how to call 3DSIFT
%
% Data is from KTH dataset and locations are purposefully chosen poorly to
% show how reRun works.

%load DemoData

tic;
for f= 43:50
    clear subs;
offset = 0;
c=strcat('running',num2str(f),'.mat');
load(c)
subs=interest_points(video3Dm);
fprintf('numer of interest points for video  %d is %d\n', f, length(subs));
if(length(subs)<80) 
    fprintf('Video number %d has lower number of interest points.',f);
    continue  
end
video3Dm=video3Dm/max(max(max(video3Dm)));
pix=video3Dm;
% Generate 50 descriptors at locations given by subs matrix
for i=1:50
    reRun = 1;
    while reRun == 1
        loc = subs(i+offset,:);
    
        %fprintf(1,'Calculating keypoint at location (%d, %d, %d)\n',loc);
        
        % Create a 3DSIFT descriptor at the given location
        [keys{i} reRun] = Create_Descriptor(pix,1,1,loc(1),loc(2),loc(3));
        
        if reRun == 1
            offset = offset + 1;
        end
        
    end
end
fprintf(1,'\nFinished...\n%d points thrown out do to poor descriptive ability.\n',offset);

for t1=1:50
des(t1+((f-1)*50),:)=keys{1,t1}.ivec;
end
fprintf('End working with video number %d\n',f);
fprintf('current length of descriptor is %d\n',length(des));
end
des_running=des;
toc;
