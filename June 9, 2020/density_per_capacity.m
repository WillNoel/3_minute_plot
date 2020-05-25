function density_per_capacity
% density_per_capacity - Generates plot of the power, capacity, and turbine 
% densities as a function of farm capacity
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
% Data files required: density_per_capacity.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 22-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('density_per_capacity.csv');
power  = data.BetzPower;
capac  = data.InstalledCapacity;
turbn  = data.TurbineCount;
footp  = data.Area;
clear data

% Generate plot:
%    x-axis = capacity per farm
%    y-axis = density
%    color  = type of density
scatter(capac,power./footp,[],[0 0 0],'o','Filled','MarkerEdgeColor','k'); hold on
scatter(capac,turbn./footp,[],[0.5 0.5 0.5],'s','Filled','MarkerEdgeColor','k');
scatter(capac,capac./footp,[],[1 1 1],'^','Filled','MarkerEdgeColor','k');
legend('Power Density (MW/km^2)','Turbine Density (turbine/km^2)',...
    'Capacity Density (MW/km^2)');
legend boxoff;
ylabel('Power/Turbine/Capacity Density','FontSize',10);
xlabel('Installed Capacity per Farm (MW)','FontSize',10);
title('Infrastructure Density per Wind Farm Installed Capacity');




