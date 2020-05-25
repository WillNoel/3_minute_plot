function turbine_vs_power
% turbine_vs_power - Generates plot of the power density vs turbine density 
% per province
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
% Data files required: turbine_vs_power.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 22-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('turbine_vs_power.csv');
power  = data.BetzPower;
capac  = data.InstalledCapacity;
turbn  = data.TurbineCount;
footp  = data.Area;
prov   = data.Province;

clear data

% Separate data by province
% Alberta
AB_idx  = find(contains(prov,'AB'));
AB_capc = capac(AB_idx);
AB_powr = power(AB_idx);
AB_turb = turbn(AB_idx);
AB_foot = footp(AB_idx);
AB_colr = [1 1 1];

% British Columbia
BC_idx  = find(contains(prov,'BC'));
BC_capc = capac(BC_idx);
BC_powr = power(BC_idx);
BC_turb = turbn(BC_idx);
BC_foot = footp(BC_idx);
BC_colr = [2/3 2/3 2/3];

% Manitoba
MB_idx  = find(contains(prov,'MB'));
MB_capc = capac(MB_idx);
MB_powr = power(MB_idx);
MB_turb = turbn(MB_idx);
MB_foot = footp(MB_idx);
MB_colr = [1/3 1/3 1/3];

% Saskatchewan
SK_idx  = find(contains(prov,'SK'));
SK_capc = capac(SK_idx);
SK_powr = power(SK_idx);
SK_turb = turbn(SK_idx);
SK_foot = footp(SK_idx);
SK_colr = [0 0 0];

% Nova Scotia
NS_idx  = find(contains(prov,'NS'));
NS_capc = capac(NS_idx);
NS_powr = power(NS_idx);
NS_turb = turbn(NS_idx);
NS_foot = footp(NS_idx);
NS_colr = [0 0 0];

% Ontario
ON_idx  = find(contains(prov,'ON'));
ON_capc = capac(ON_idx);
ON_powr = power(ON_idx);
ON_turb = turbn(ON_idx);
ON_foot = footp(ON_idx);
ON_colr = [1/2 1/2 1/2];

% Quebec
QC_idx  = find(contains(prov,'QC'));
QC_capc = capac(QC_idx);
QC_powr = power(QC_idx);
QC_turb = turbn(QC_idx);
QC_foot = footp(QC_idx);
QC_colr = [1 1 1];


% y = 2x
x = linspace(0,200);
y = 2.*x;

% Generate scatter plot:
%    x-axis = turine density
%    y-axis = capacity density
%    size   = constant
%    color  = province
scatter(AB_turb,AB_capc,[],'o','MarkerEdgeColor','k'); hold on
scatter(BC_turb,BC_capc,[],'s','MarkerEdgeColor','k');
scatter(MB_turb,MB_capc,[],'d','MarkerEdgeColor','k');
scatter(NS_turb,NS_capc,[],'x','MarkerEdgeColor','k');
scatter(ON_turb,ON_capc,[],'*','MarkerEdgeColor','k');
scatter(QC_turb,QC_capc,[],'^','MarkerEdgeColor','k');
scatter(SK_turb,SK_capc,[],'v','MarkerEdgeColor','k');
plot(x,y,'k--');
xlabel('Turbines per Farm','FontSize',10);
ylabel('Capacity per Farm (MW)','FontSize',10);
title('Turbines Installed vs. Capacity per Farm');
legend('AB','BC','MB','NS','ON','QC','SK','y = 2x','location','northwest');
legend boxoff


