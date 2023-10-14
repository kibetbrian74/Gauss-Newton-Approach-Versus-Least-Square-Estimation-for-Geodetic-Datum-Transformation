%% Data Partitioning
SOURCEDATA = horzcat(ref_cartesian,obs_cartesian);
partitioned = cvpartition(size(SOURCEDATA,1),'HoldOut',0.3);
format long;
%Training Data
TrainingData = SOURCEDATA(partitioned.training,:);
%Testing Data
TestingData = SOURCEDATA(partitioned.test,:);
clearvars partitioned;
%% Clear Temporary Variables
clearvars latCR latWR longCR longWR;
clearvars aC e2C e2W bW aW bC vC vW;
clearvars LatitudeW SOURCEDATA LongitudeW HeightW LatitudeC LongitudeC HeightC;