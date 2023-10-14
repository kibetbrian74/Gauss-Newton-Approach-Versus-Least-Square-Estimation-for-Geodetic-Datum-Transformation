%% Import data from text file.
% Script for importing data from the following text file:
%
%    D:\Attachment\Matlab Codes\source data.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2023/09/11 14:49:09

%% Initialize variables.
Source_Data = 'D:\Attachment\Matlab Codes\source data.csv';
delimiter = ',';
startRow = 3;

%% Format string for each line of text:
%   column1: text (%s)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(Source_Data,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Description = dataArray{:, 1};
LatitudeW = dataArray{:, 2};
LongitudeW = dataArray{:, 3};
HeightW = dataArray{:, 4};
LatitudeC = dataArray{:, 5};
LongitudeC = dataArray{:, 6};
HeightC = dataArray{:, 7};

%% Clear temporary variables
clearvars Source_Data delimiter startRow formatSpec fileID dataArray ans;