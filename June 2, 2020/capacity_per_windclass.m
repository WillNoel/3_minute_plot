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
AB_colr = [1/2 1/2 1/2];

% British Columbia
BC_idx  = find(contains(prov,'BC'));
BC_yr   = yr(BC_idx);
BC_capc = capc(BC_idx);
BC_clas = clas(BC_idx);
BC_colr = [0 0 0];

% Manitoba
MB_idx  = find(contains(prov,'MB'));
MB_yr   = yr(MB_idx);
MB_capc = capc(MB_idx);
MB_clas = clas(MB_idx);

% Saskatchewan
SK_idx  = find(contains(prov,'SK'));
SK_yr   = yr(SK_idx);
SK_capc = capc(SK_idx);
SK_clas = clas(SK_idx);

% Eastern Praries (MB + SK)
EP_yr   = [MB_yr;SK_yr];
EP_capc = [MB_capc;SK_capc];
EP_clas = [MB_clas;SK_clas];
EP_colr = [1 1 1];

% Nova Scotia
NS_idx  = find(contains(prov,'NS'));
NS_yr   = yr(NS_idx);
NS_capc = capc(NS_idx);
NS_clas = clas(NS_idx);

% New Brunswick
NB_idx  = find(contains(prov,'NB'));
NB_yr   = yr(NB_idx);
NB_capc = capc(NB_idx);
NB_clas = clas(NB_idx);

% Newfoundland
NL_idx  = find(contains(prov,'NL'));
NL_yr   = yr(NL_idx);
NL_capc = capc(NL_idx);
NL_clas = clas(NL_idx);

% Prince Edward Island
PEI_idx = find(contains(prov,'PEI'));
PEI_yr  = yr(PEI_idx);
PEI_capc= capc(PEI_idx);
PEI_clas= clas(PEI_idx);

% Atlantic Canada
AC_yr   = [NS_yr;NB_yr;NL_yr;PEI_yr];
AC_capc = [NS_capc;NB_capc;NL_capc;PEI_capc];
AC_clas = [NS_clas;NB_clas;NL_clas;PEI_clas];
AC_colr = [1 1 1];

% Ontario
ON_idx  = find(contains(prov,'ON'));
ON_yr   = yr(ON_idx);
ON_capc = capc(ON_idx);
ON_clas = clas(ON_idx);
ON_colr = [0 0 0];

% Quebec
QC_idx  = find(contains(prov,'QC'));
QC_yr   = yr(QC_idx);
QC_capc = capc(QC_idx);
QC_clas = clas(QC_idx);
QC_colr = [1/2 1/2 1/2];

% Generate scatter plot:
%    x-axis = year
%    y-axis = wind class
%    size   = capacity
%    color  = province

% BC + Prarie Provinces
subplot(2,1,1);
scatter(BC_yr,BC_clas,BC_capc*2,BC_colr,'o','Filled','MarkerEdgeColor','k'); hold on
scatter(AB_yr,AB_clas,AB_capc*2,AB_colr,'o','Filled','MarkerEdgeColor','k'); 
scatter(EP_yr,EP_clas,EP_capc*2,EP_colr,'o','Filled','MarkerEdgeColor','k');
% Axes labels and limits
ylabel('Wind Class');
xlim([1998 2020]);
ylim([0 7]);
%title('Annual Installed Capacity by Wind Class and Province');
legend('BC','AB','EP','location','eastoutside');
legend boxoff;

% Eastern Provinces
subplot(2,1,2);
scatter(ON_yr,ON_clas,ON_capc*2,ON_colr,'o','Filled','MarkerEdgeColor','k'); hold on
scatter(QC_yr,QC_clas,QC_capc*2,QC_colr,'o','Filled','MarkerEdgeColor','k');
scatter(AC_yr,AC_clas,AC_capc*2,AC_colr,'o','Filled','MarkerEdgeColor','k'); 
% Axes labels and limits
xlabel('Year');
ylabel('Wind Class');
xlim([1998 2020]);
ylim([0 7]);
legend('ON','QC','AC','location','eastoutside');
legend boxoff;

% Window size
set(gcf,'Position',[200 200 900 600]); % [xpos ypos width height]

% Label two of the bubbles for scale
subplot(2,1,1)
n1    = find(SK_yr==2001);
lbl_1 = sprintf('%2.0f MW\n    \\downarrow',SK_capc(n1));
text(2000.3,SK_clas(n1)+0.75,lbl_1);
n2    = find(AB_yr==2014);
lbl_2 = sprintf('%2.0f MW\n    \\downarrow',AB_capc(n2(1)));
text(2013.3,AB_clas(n2(1))+1.25,lbl_2);


