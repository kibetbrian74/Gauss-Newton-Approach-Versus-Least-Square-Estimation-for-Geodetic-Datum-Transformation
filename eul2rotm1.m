function R = eul2rotm1(euler_angles)
    % Convert Euler angles (roll, pitch, yaw) to a rotation matrix
    roll = euler_angles(1);
    pitch = euler_angles(2);
    yaw = euler_angles(3);
    
    % Define rotation matrices for each axis
    R_x = [1 0 0; 0 cos(roll) -sin(roll); 0 sin(roll) cos(roll)];
    R_y = [cos(pitch) 0 sin(pitch); 0 1 0; -sin(pitch) 0 cos(pitch)];
    R_z = [cos(yaw) -sin(yaw) 0; sin(yaw) cos(yaw) 0; 0 0 1];
    
    % Combine the rotation matrices
    R = R_z * R_y * R_x;
end
