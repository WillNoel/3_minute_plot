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
boxplot(cp,yr,'Colors','k','Symbol','k+'); hold on
ylim([-25 375]);
xlabel('Year');
ylabel('Installed Capacity (MW)');
set(gcf,'Position',[200 300 1000 300]); % [xpos ypos width height]

% Plot 'dummy' variables for legend entry
scatter(1,1,1,[0 0 0],'s');
plot(1,1,'k-');
plot(1,1,'k--');
scatter(1,1,1,[0 0 0],'+');
legend('IQR','Median','Min/Max','Outliers','Location','NorthWest');
legend boxoff;

