%% Assigning variables to the columns
Xw2 = TestingData(:,1);
Yw2 = TestingData(:,2);
Zw2 = TestingData(:,3);
Xc2 = TestingData(:,4);
Yc2 = TestingData(:,5);
Zc2 = TestingData(:,6);
%% Concatenating the columns for a readable coordinate values
%The output should be:
System1_Clarke1880 = horzcat(Xc2,Yc2,Zc2);
System2_wgs84 = horzcat(Xw2,Yw2,Zw2);
%% Clear Temporary variables
clearvars Xw2 Yw2 Zw2 Xc2 Yc2 Zc2;
