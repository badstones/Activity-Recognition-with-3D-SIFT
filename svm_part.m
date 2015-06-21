TrainingX=[signeture(11:50,:);signeture(61:100,:);signeture(111:150,:);signeture(161:200,:);signeture(211:250,:);signeture(261:300,:)];%;...
%signeture(151:180,:);signeture(191:200,:);signeture(201:230,:);signeture(241:250,:);signeture(251:280,:);signeture(291:300,:)  ];
TrainingY=[zeros(200,1);ones(40,1)];
TestingX=[signeture(1:10,:);signeture(51:60,:);signeture(101:110,:);signeture(151:160,:);signeture(201:210,:);signeture(251:260,:)];%;signeture(41:50,:);signeture(91:100,:);];
TestingY=[zeros(50,1);ones(10,1)];

svmStruct = svmtrain(TrainingX,TrainingY);%'Kernel_Function','rbf','rbf_sigma',5 );
svmResultT = svmclassify(svmStruct, TrainingX);
svmResultF = svmclassify(svmStruct, TestingX);
xor_result=xor(svmResultF,TestingY);
tr=60-sum(xor_result);
acc=uint8(100*tr/60);

result=multisvm(TrainingX,TrainingY,TestingX);
tt=confmat(TestingY,result);
acc=trace(tt)/120