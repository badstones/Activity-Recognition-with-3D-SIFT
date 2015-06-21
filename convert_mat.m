[pathstr,name,ext] = fileparts(['Training_data_walk.avi']);
fout = ['/Users/sourabhkulhare/Documents/MATLAB/3DSIFT_CODE_v1/',name,'.mat'];
save(fout,'Trainning_data_walk');