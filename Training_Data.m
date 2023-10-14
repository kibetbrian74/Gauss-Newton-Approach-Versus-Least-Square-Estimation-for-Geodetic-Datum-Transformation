%% Assigning variables to the columns
Xw1 = TrainingData(:,1);
Yw1 = TrainingData(:,2);
Zw1 = TrainingData(:,3);
Xc1 = TrainingData(:,4);
Yc1 = TrainingData(:,5);
Zc1 = TrainingData(:,6);
%% Concatenating the assigned variables
% This will enable generation of:
% System 1 coordinates
Syst1_Clarke1880 = horzcat(Xc1,Yc1,Zc1);

%System 22 coordinates
Syst2_wgs84 = horzcat(Xw1,Yw1,Zw1);

%% Clear temporary variables
clearvars Xw1 Yw1 Zw1 Xc1 Yc1 Zc1;
