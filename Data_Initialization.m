%% Data Import
reference_data = horzcat(LatitudeW,LongitudeW,HeightW);
% Defining wgs84 data in radians
latitudeW = deg2rad(reference_data(:,1));
longitudeW = deg2rad(reference_data(:,2));
ellipsoidal_heightW = reference_data(:,3);

obs_data = horzcat(LatitudeC, LongitudeC, HeightC);
%% WGS 84 Conversion
ref_cartesian = lla2ecef(reference_data);
% filename = 'D:\Attachment\Corrected data\New folder\WGS84 cart coordinates.csv';
% csvwrite(filename,ref_cartesian);
%% Constants
% Define Clarke 1880 ellipsoid parameters
a = 6378249.145; % Semi-major axis in meters
f = 1 / 293.465; % Flattening factor

%%
% Define geodetic coordinates (latitude, longitude, and ellipsoidal height)
latitudeC = deg2rad(obs_data(:,1));
longitudeC = deg2rad(obs_data(:,2));
ellipsoidal_heightC = obs_data(:,3);

%%
% Calculate auxiliary parameters
e_2C = 2*f - f^2; % Eccentricity squared
vC = a ./ sqrt(1 - e_2C * sin(latitudeC).^2); % Prime vertical radius of curvature

%%
% Calculate Cartesian coordinates (X, Y, Z)
XC = (vC + ellipsoidal_heightC) .* cos(latitudeC) .* cos(longitudeC);
YC = (vC + ellipsoidal_heightC) .* cos(latitudeC) .* sin(longitudeC);
ZC = (vC * (1 - e_2C) + ellipsoidal_heightC) .* sin(latitudeC);
%% Results
% Your Cartesian coordinates (X, Y, Z) are now in meters
obs_cartesian = [XC YC ZC];
% Writing in CSV format
% filename2 = 'D:\Attachment\Corrected data\New folder\Clarke1880 Coordinates.csv';
% csvwrite(filename2,obs_cartesian);
%% Clear temporary variables
clearvars a f e_2C latCR longCR vC XC YC ZC;
clearvars latitudeC longitudeC ellipsoidal_heightC;
clearvars latitudeW longitudeW ellipsoidal_heightW;
clearvars obs_data reference_data;
