function capacity_per_windclass
% turbine_size - Generates bubble plot showing timeline of  installed
% capacity of wind per province on a basis of wind class
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
% Data files required: capacity_per_windclass.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 21-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('capacity_per_windclass.csv');
yr     = data.Year;
prov   = data.Province;
capc   = data.Capacity;
clas   = data.WindClass;
clear data

% Clear rows with zeros in capacity column
idx = find(capc==0);
yr(idx)   = [];
prov(idx) = [];
capc(idx) = [];
clas(idx) = [];

% Separate data by province

% Alberta
AB_idx  = find(contains(prov,'AB'));
AB_yr   = yr(AB_idx);
AB_capc = capc(AB_idx);
AB_clas = clas(AB_idx);
AB_colr = [1 1 1];

% British Columbia
BC_idx  = find(contains(prov,'BC'));
BC_yr   = yr(BC_idx);
BC_capc = capc(BC_idx);
BC_clas = clas(BC_idx);
BC_colr = [6/7 6/7 6/7];

% Manitoba
MB_idx  = find(contains(prov,'MB'));
MB_yr   = yr(MB_idx);
MB_capc = capc(MB_idx);
MB_clas = clas(MB_idx);
MB_colr = [5/7 5/7 5/7];

% Nova Scotia
NS_idx  = find(contains(prov,'NS'));
NS_yr   = yr(NS_idx);
NS_capc = capc(NS_idx);
NS_clas = clas(NS_idx);
NS_colr = [4/7 4/7 4/7];

% Ontario
ON_idx  = find(contains(prov,'ON'));
ON_yr   = yr(ON_idx);
ON_capc = capc(ON_idx);
ON_clas = clas(ON_idx);
ON_colr = [3/7 3/7 3/7];

% Quebec
QC_idx  = find(contains(prov,'QC'));
QC_yr   = yr(QC_idx);
QC_capc = capc(QC_idx);
QC_clas = clas(QC_idx);
QC_colr = [2/7 2/7 2/7];

% Saskatchewan
SK_idx  = find(contains(prov,'SK'));
SK_yr   = yr(SK_idx);
SK_capc = capc(SK_idx);
SK_clas = clas(SK_idx);
SK_colr = [0 0 0];

% Generate scatter plot:
%    x-axis = year
%    y-axis = wind class
%    size   = capacity
%    color  = province

hold on
scatter(AB_yr,AB_clas,AB_capc*2,AB_colr,'o','Filled','MarkerEdgeColor','k');
scatter(BC_yr,BC_clas,BC_capc*2,BC_colr,'s','Filled','MarkerEdgeColor','k');
scatter(MB_yr,MB_clas,MB_capc*2,MB_colr,'d','Filled','MarkerEdgeColor','k');
scatter(NS_yr,NS_clas,NS_capc*2,NS_colr,'^','Filled','MarkerEdgeColor','k');
scatter(ON_yr,ON_clas,ON_capc*2,ON_colr,'v','Filled','MarkerEdgeColor','k');
scatter(QC_yr,QC_clas,QC_capc*2,QC_colr,'h','Filled','MarkerEdgeColor','k');
scatter(SK_yr,SK_clas,SK_capc*2,SK_colr,'p','Filled','MarkerEdgeColor','k');


% Window size
set(gcf,'Position',[200 500 900 300]); % [xpos ypos width height]

% Axes labels and limits
xlabel('Year','FontSize',10);
ylabel('Wind Class','FontSize',10);
xlim([1990 2020]);
ylim([0 7]);
title('Provincial Installed Capacity by Wind Class');
legend('AB','BC','MB','NS','ON','QC','SK','location','northwest');
legend boxoff;
