%% Function to carry out standard deviation
function std_dev = std1(data)
    % Check if the input data is empty or has only one element
    if isempty(data) || numel(data) == 1
        error('Input data must have at least two elements.');
    end
    
    % Calculate the mean (average) of the data
    mean_data = mean(data);
    
    % Calculate the squared differences from the mean
%     squared_diff = (data - mean_data).^2;
    
    mean_x = mean_data(1,1);
    mean_y = mean_data(1,2);
    mean_z = mean_data(1,3);
    
    data_x = data(:,1);
    data_y = data(:,2);
    data_z = data(:,3);
    
    diff_datax = data_x - mean_x;
    diff_datay = data_y - mean_y;
    diff_dataz = data_z - mean_z;
    
    sqrd_diff_datax = (diff_datax).^2;
    sqrd_diff_datay = (diff_datay).^2;
    sqrd_diff_dataz = (diff_dataz).^2;
    
    squared_diff = horzcat(sqrd_diff_datax,sqrd_diff_datay,sqrd_diff_dataz);
    
    % Calculate the variance as the average of squared differences
    variance = mean(squared_diff);
    
    % Calculate the standard deviation as the square root of the variance
    std_dev = sqrt(variance);
end