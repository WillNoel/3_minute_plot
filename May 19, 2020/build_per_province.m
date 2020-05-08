function build_per_province
% build_per_province - Generates plot of cumulative capacity of wind power
% built in Canada over time, split by province
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
% Data files required: build_per_province.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 08-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('build_per_province.csv');
year   = data.Year;
ab     = data.AB;
bc     = data.BC;
mb     = data.MB;
ns     = data.NS;
on     = data.ON;
qc     = data.QC;
sk     = data.SK;
clear data

% Sort all data by date
[year,idx] = sort(year);
ab         = ab(idx,:);
bc         = bc(idx,:);
mb         = mb(idx,:);
ns         = ns(idx,:);
on         = on(idx,:);
qc         = qc(idx,:);
sk         = sk(idx,:);

% Generate matrix for stacked area plotting
stack = [on qc ab ns bc mb sk];

% Generate stacked area plot:
%    x-axis = year
%    y-axis = rating
%    color  = province
fig = area(year,stack,'EdgeColor','None');
xlabel('Year','FontSize',10);
ylabel('Installed Capacity (MW)','FontSize',10);
title('Cumulative Installed Wind Capacity');
legend('Ontario','Quebec','Alberta','Nova Scotia','British Columbia',...
    'Manitoba','Saskatchewan','location','northwest');
legend boxoff;

% Loop through and set colormap to greyscale
clr = [6/7 6/7 6/7];
for i = 1:7
    fig(i).FaceColor = clr;
    clr = clr - 1/7;
end










