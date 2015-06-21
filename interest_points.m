function [subs] = interest_points(video3Dm)
num_of_frames= length(video3Dm(:,:,:,1));
sub_total=[];
for i=1:15:num_of_frames
pt =kp_harrislaplace(video3Dm(:,:,i));
num_interest_points= length(pt(:,1));
if num_interest_points>=10
sub=pt(1:10,1:2);
if i==1
sub_total= [sub(:,1), sub(:,2), ones(max(length(sub(:,1))),1)];
else 
sub_total=[sub_total; [sub(:,1), sub(:,2),i*ones(max(length(sub(:,1))),1)]];
end
end
end
subs=sub_total;
end