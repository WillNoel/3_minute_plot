function turbine_size
% turbine_size - Generates plot of the size of Canadian wind turbines over
% time
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
% Data files required: turbine_data.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 07-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('turbine_data.csv');
year   = data.Year;
rating = data.Rating;
height = data.Height;
diamtr = data.Diameter;
clear data

% Sort all data by date
[year,idx] = sort(year);
rating     = rating(idx,:);
height     = height(idx,:);
diamtr     = diamtr(idx,:);

% Generate scatter plot:
%    x-axis = year
%    y-axis = height
%    size   = diameter
%    color  = rating
scatter(year,height,diamtr*3,rating,'filled','MarkerEdgeColor','k');
xlabel('Year','FontSize',10);
ylabel('Hub Height (m)','FontSize',10);
title('Canadian Turbine Size by Year');
clr = colorbar; ylabel(clr,'Rating (kW)');
colormap(jet);






