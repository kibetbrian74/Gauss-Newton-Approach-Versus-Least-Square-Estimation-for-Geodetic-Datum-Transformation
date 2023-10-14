% Define a function to compute the residuals (errors) between transformed points
function residuals = transform_points(params, points1, points2)
    % Extract parameters
    tx = params(1);
    ty = params(2);
    tz = params(3);
    rx = params(4);
    ry = params(5);
    rz = params(6);
    scale = params(7);
    
    % Create the transformation matrix
    R = eul2rotm1([rx, ry, rz]); %Convert euler angles to rotation matrix
    T = [R,[tx; ty; tz]]*scale;
    
    % Apply the transformation to points1
    transformed_points = (T * [points1'; ones(1, size(points1, 1))])';
    
    % Compute the residuals (errors) by subtracting transformed_points from points2
    residuals = transformed_points - points2;
    
    % Flatten residuals into a column vector
    residuals = residuals(:);
end