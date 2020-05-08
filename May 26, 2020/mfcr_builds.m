function mfcr_builds
% bfcr_builds - Generates plot of cumulative wind turbine builds in Canada
% per manufacturer, split by province
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
% Data files required: mfcr_builds.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 08-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('mfcr_builds.csv');
prov   = data.Province;
ve     = data.Vestas;
ge     = data.GE;
si     = data.Siemens;
en     = data.Enercon;
se     = data.Senvion;
ot     = data.Other;
clear data

% Generate matrix for stacked area plotting
stack = [ve ge si en se ot];
label = categorical(prov);

% Generate stacked bar chart:
%    x-axis = province
%    y-axis = turbine builds
%    color  = manufacturer
fig = bar(label,stack,'stacked','EdgeColor','None');
xlabel('Province','FontSize',10);
ylabel('Installed Turbines','FontSize',10);
title('Turbine Builds per Manufacturer');
legend('Vestas','General Electric','Siemens','Enercon','Senvion',...
    'Other','location','northwest');
legend boxoff;

% Loop through and set colormap to greyscale
clr = [5/6 5/6 5/6];
for i = 1:6
    fig(i).FaceColor = clr;
    clr = clr - 1/6;
end
    

