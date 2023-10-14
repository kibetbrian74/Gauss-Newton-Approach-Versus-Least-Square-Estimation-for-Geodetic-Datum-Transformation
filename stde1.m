%% Calculating Standard Error
function [ stand_error ] = stde1( data )
%SDE calculates the standard error
%   check if input is empty
if isempty(data) || numel(data) == 1
    error('Input data must have two or more elements');
end
%SIZE of the data
r = size(data,1);
% MEAN of the data
mean_data = mean1(data);
% ELEMENTS of the mean
mean_x = mean_data(1,1);
mean_y = mean_data(1,2);
mean_z = mean_data(1,3);
% ELEMENTS of the input data
data_x = data(:,1);
data_y = data(:,2);
data_z = data(:,3);
%DIFFERENCE
diff_x = data_x - mean_x;
diff_y = data_y - mean_y;
diff_z = data_z - mean_z;

% SQUARED DIFFERENCES
sdiff_x = (diff_x).^2;
sdiff_y = (diff_y).^2;
sdiff_z = (diff_z).^2;
%SUM OF DIFFERENCES
sum_sdiff_x = sum(sdiff_x);
sum_sdiff_y = sum(sdiff_y);
sum_sdiff_z = sum(sdiff_z);

a = r-1;
mean2_x = sum_sdiff_x/a;
mean2_y = sum_sdiff_y/a;
mean2_z = sum_sdiff_z/a;

sde_x = sqrt(mean2_x);
sde_y = sqrt(mean2_y);
sde_z = sqrt(mean2_z);

stand_error = horzcat(sde_x,sde_y,sde_z);
end

