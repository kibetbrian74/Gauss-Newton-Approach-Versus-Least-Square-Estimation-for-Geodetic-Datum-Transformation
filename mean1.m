%% Calculating Mean
function mean = mean1(data)
% Calculating mean from a set of observation data
% Check if the input is empty
if isempty(data) || numel(data) == 1
    error('Input Data should have atleast two elements.');
end

sum_data = sum(data);
n = size(data,1);
mean = sum_data/n;

end