function average_sz
% average_sz - Generates boxplot of average wind farm size built in Canada
% per year
% 
% References:
%    N/A
%
% Syntax:
%    N/A
%
% Inputs:
%    N/A
%
% Outputs:
%    N/A
%
% Example: 
%    N/A
%
% Other m-files required: none
% Data files required: average_sz.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% June 2020; Last revision: 08-June-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('average_sz.csv');
yr     = data.Year;
cp     = data.Capacity;
clear data

% Create boxplot
boxplot(cp,yr);
ylim([-25 375]);
xlabel('Year');
ylabel('Installed Capacity (MW)');
set(gcf,'Position',[200 500 1000 300]); % [xpos ypos width height]

