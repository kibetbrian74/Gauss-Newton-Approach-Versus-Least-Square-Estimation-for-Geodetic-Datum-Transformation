%% Notes
% The traditional method uses singular value decomposition (svd) to
% calculates for the transformation parameters

%% Data Import
observed = Syst1_Clarke1880;
reference = Syst2_wgs84;

%% Center the Data
centroid_observed = mean(observed);
centroid_reference = mean(reference);

%% Splitting the Data
% Observed data
Xobs = observed(:,1);
Yobs = observed(:,2);
Zobs = observed(:,3);
% Reference Data
Xref = reference(:,1);
Yref = reference(:,2);
Zref = reference(:,3);
% Centroids
Xc_obs = centroid_observed(1,1);
Yc_obs = centroid_observed(1,2);
Zc_obs = centroid_observed(1,3);

Xc_ref = centroid_reference(1,1);
Yc_ref = centroid_reference(1,2);
Zc_ref = centroid_reference(1,3);
%% Differences
% Observed
Xd_obs = Xobs - Xc_obs;
Yd_obs = Yobs - Yc_obs;
Zd_obs = Zobs - Zc_obs;
d_obs = horzcat(Xd_obs, Yd_obs, Zd_obs);

% Reference
Xd_ref = Xref - Xc_ref;
Yd_ref = Yref - Yc_ref;
Zd_ref = Zref - Zc_ref;
d_ref = horzcat(Xd_ref, Yd_ref, Zd_ref);
%% Calculating Transformation Parameters
% Using Singular Value Decompoition in Least Square Adjustment
H = d_ref' * d_obs;
[U, ~, V] = svd(H);
R = V * U';

scale = trace(d_obs'*d_obs)/trace(d_ref'*d_ref);
T = centroid_observed' - scale*R*centroid_reference';
%% Clear Temporary Variables
% clearvars observed reference centroid_observed centroid_reference;
clearvars Xobs Yobs Zobs Xref Yref Zref Xc_obs Ycobs Zc_obs;
clearvars Xc_ref Yc_ref Zc_ref Xd_obs Yd_obs Zd_obs d_obs;
clearvars Xd_ref Yd_ref Zd_ref d_ref;
clearvars H U V; 
clearvars TrainingData TestingData SOURCEDATA;
