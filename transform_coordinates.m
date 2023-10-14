function transformed_coords = transform_coordinates(input_coords, transform_params)
    % Input coordinates should be an Nx3 matrix (N points in 3D space)
    % Transformation parameters should be a 7x1 column vector
    
    % Extract the translation, scale, and rotation components from the parameters
    translation = transform_params(1:3);
    scale = transform_params(4);
    rotations = transform_params(5:7);

    % Create translation matrix
    translation_matrix = eye(4);
    translation_matrix(1:3, 4) = translation;

    % Create scaling matrix
    scale_matrix = eye(4);
    scale_matrix(1:3, 1:3) = scale * eye(3);

    % Create rotation matrices for X, Y, and Z axes
    rotation_matrix_x = [1, 0, 0, 0;
                         0, cos(rotations(1)), -sin(rotations(1)), 0;
                         0, sin(rotations(1)), cos(rotations(1)), 0;
                         0, 0, 0, 1];

    rotation_matrix_y = [cos(rotations(2)), 0, sin(rotations(2)), 0;
                         0, 1, 0, 0;
                         -sin(rotations(2)), 0, cos(rotations(2)), 0;
                         0, 0, 0, 1];

    rotation_matrix_z = [cos(rotations(3)), -sin(rotations(3)), 0, 0;
                         sin(rotations(3)), cos(rotations(3)), 0, 0;
                         0, 0, 1, 0;
                         0, 0, 0, 1];

    % Combine all transformation matrices
    transformation_matrix = translation_matrix * scale_matrix * rotation_matrix_x * rotation_matrix_y * rotation_matrix_z;

    % Homogeneous coordinates
    input_coords_homogeneous = [input_coords, ones(size(input_coords, 1), 1)]';

    % Apply the transformation
    transformed_coords_homogeneous = (transformation_matrix * input_coords_homogeneous)';

    % Convert back to 3D coordinates
    transformed_coords = transformed_coords_homogeneous(:, 1:3);
end