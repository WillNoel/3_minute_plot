function provincial_windclass
% provincial_windclass - Generates plot of the proportion of installed
% capacity of wind in each province split by NREL wind class
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
% Data files required: provincial_windclass.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 21-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('provincial_windclass.csv');
prov   = data.Province;
cls1   = data.Class1;
cls2   = data.Class2;
cls3   = data.Class3;
cls4   = data.Class4;
cls5   = data.Class5;
cls6   = data.Class6;
clear data

% Generate matrix for stacked plotting
stack = [cls1 cls2 cls3 cls4 cls5 cls6];
label = categorical(prov);

% Generate stacked bar chart:
%    x-axis = province
%    y-axis = fraction of capacity
%    color  = wind class
fig = bar(label,stack,'stacked','EdgeColor','None');
xlabel('Province','FontSize',10);
ylabel('Fraction of Installed Capacity','FontSize',10);
title('Provincial Installed Capacity per Wind Class');
lgn = legend('1','2','3','4','5','6','location','eastoutside');
legend boxoff;
lgn.Title.String = 'Wind Class';
ylim([0 1]);

% Loop through and set colormap to greyscale
clr = [5/6 5/6 5/6];
for i = 1:6
    fig(i).FaceColor = clr;
    clr = clr - 1/6;
end
   

