function power_density
% power_density - Generates plot of the frequency distribution of 
% installed capacity, power, and turibine density
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
% Data files required: power_density.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 21-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('power_density.csv');
power  = data.PowerDensity;
capac  = data.CapacityDensity;
turbn  = data.TurbineDensity;
clear data

% Convert data into bins for plotting
edge   = 0:0.25:5.5;
hpower = histcounts(power,edge);
hcapac = histcounts(capac,edge);
hturbn = histcounts(turbn,edge);

% Convert to frequency and group into a single matrix
hpower = hpower./sum(hpower);
hcapac = hcapac./sum(hcapac);
hturbn = hturbn./sum(hturbn);
histog = transpose([hpower; hcapac; hturbn]);

% Generate histogram:
%    bins = density functions
%    y-axis = frequency
fig = bar(edge(1:end-1),histog,'EdgeColor','none','BarWidth',1);
xlabel('Bins','FontSize',10);
ylabel('Frequency','FontSize',10);
title('Density Frequency Distributions');
legend('Power Density (MW/km^2)','Capacity Denstiy (MW/km^2)',...
    'Turbine Density (turbine/km^2)','location','northeast');
legend boxoff

% Loop through and set colormap to greyscale
clr = [0.8 0.8 0.8];
for i = 1:3
    fig(i).FaceColor = clr;
    clr = clr - 0.4;
end

