function capacity_per_windclass
% turbine_size - Generates bubble plot showing timeline of installed
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
% May 2020; Last revision: 22-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('capacity_per_windclass.csv');
yr     = data.Year;
prov   = data.Province;
capc   = data.Capacity;
clas   = data.WindClass;
clear data

% Clear rows with low capacity
idx = find(capc<3);
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
BC_colr = [2/3 2/3 2/3];

% Manitoba
MB_idx  = find(contains(prov,'MB'));
MB_yr   = yr(MB_idx);
MB_capc = capc(MB_idx);
MB_clas = clas(MB_idx);
MB_colr = [1/3 1/3 1/3];

% Saskatchewan
SK_idx  = find(contains(prov,'SK'));
SK_yr   = yr(SK_idx);
SK_capc = capc(SK_idx);
SK_clas = clas(SK_idx);
SK_colr = [0 0 0];

% Nova Scotia
NS_idx  = find(contains(prov,'NS'));
NS_yr   = yr(NS_idx);
NS_capc = capc(NS_idx);
NS_clas = clas(NS_idx);
NS_colr = [0 0 0];

% Ontario
ON_idx  = find(contains(prov,'ON'));
ON_yr   = yr(ON_idx);
ON_capc = capc(ON_idx);
ON_clas = clas(ON_idx);
ON_colr = [1/2 1/2 1/2];

% Quebec
QC_idx  = find(contains(prov,'QC'));
QC_yr   = yr(QC_idx);
QC_capc = capc(QC_idx);
QC_clas = clas(QC_idx);
QC_colr = [1 1 1];

% Generate scatter plot:
%    x-axis = year
%    y-axis = wind class
%    size   = capacity
%    color  = province

% BC + Prarie Provinces
subplot(2,1,1);
scatter(AB_yr,AB_clas,AB_capc*2,AB_colr,'o','Filled','MarkerEdgeColor','k'); hold on
scatter(BC_yr,BC_clas,BC_capc*2,BC_colr,'o','Filled','MarkerEdgeColor','k');
scatter(MB_yr,MB_clas,MB_capc*2,MB_colr,'o','Filled','MarkerEdgeColor','k');
scatter(SK_yr,SK_clas,SK_capc*2,SK_colr,'o','Filled','MarkerEdgeColor','k');
% Axes labels and limits
ylabel('Wind Class','FontSize',10);
xlim([1998 2020]);
ylim([0 7]);
title('Provincial Installed Capacity by Wind Class');
legend('AB','BC','MB','SK','location','eastoutside');
legend boxoff;

% Eastern Provinces
subplot(2,1,2);
scatter(ON_yr,ON_clas,ON_capc*2,ON_colr,'o','Filled','MarkerEdgeColor','k'); hold on
scatter(QC_yr,QC_clas,QC_capc*2,QC_colr,'o','Filled','MarkerEdgeColor','k');
scatter(NS_yr,NS_clas,NS_capc*2,NS_colr,'o','Filled','MarkerEdgeColor','k'); 
% Axes labels and limits
xlabel('Year','FontSize',10);
ylabel('Wind Class','FontSize',10);
xlim([1998 2020]);
ylim([0 7]);
legend('ON','QC','NS','location','eastoutside');
legend boxoff;

% Window size
set(gcf,'Position',[200 200 900 600]); % [xpos ypos width height]

% Label two of the bubbles for scale
subplot(2,1,1)
n1    = find(SK_yr==2001);
lbl_1 = sprintf('%2.0f MW\n    \\downarrow',SK_capc(n1));
text(2000.3,SK_clas(n1)+0.75,lbl_1);
n2    = find(AB_yr==2014);
lbl_2 = sprintf('%2.0f MW\n    \\downarrow',AB_capc(n2(2)));
text(2013.3,AB_clas(n2(2))+1.25,lbl_2);


