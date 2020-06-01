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
nb     = data.NB;
nl     = data.NL;
ns     = data.NS;
on     = data.ON;
pei    = data.PEI;
qc     = data.QC;
sk     = data.SK;
clear data

% Sort all data by date
[year,idx] = sort(year);
ab         = ab(idx,:);
bc         = bc(idx,:);
mb         = mb(idx,:);
nb         = nb(idx,:);
nl         = nl(idx,:);
ns         = ns(idx,:);
on         = on(idx,:);
pei        = pei(idx,:);
qc         = qc(idx,:);
sk         = sk(idx,:);

% Combine provinces for brevity
ac    = nl+nb+pei+ns;   % Atlantic Canada (maritimes)
ep    = sk+mb;          % Eastern Praries

% Generate matrix for stacked area plotting
stack = [on qc ab ac bc ep];

% Generate stacked area plot:
%    x-axis = year
%    y-axis = rating
%    color  = province
fig = area(year,stack/1000,'EdgeColor','None');
xlabel('Year');
ylabel('Installed Capacity (GW)');
%title('Cumulative Installed Wind Capacity');
legend('ON','QC','AB','AC','BC','EP','location','northwest');
legend boxoff;
xlim([1995 2020]);

% Loop through and set colormap to greyscale
clr = [5/6 5/6 5/6];
for i = 1:6
    fig(i).FaceColor = clr;
    clr = clr - 1/6;
end