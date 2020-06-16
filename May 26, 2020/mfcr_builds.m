function mfcr_builds
% bfcr_builds - Generates plot of wind turbine Capacity in Canada
% per manufacturer
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
% May 2020; Last revision: 09-June-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data    = readtable('mfcr_builds.csv');
prov    = data.Province;
yr      = data.Year;
vestas  = data.Vestas;
ge      = data.GE;
siemens = data.Siemens;
enercon = data.Enercon;
senvion = data.Senvion;
other   = data.Other;
clear data

% Find indices for each province
AB_idx  = find(contains(prov,'AB'));
BC_idx  = find(contains(prov,'BC'));
ON_idx  = find(contains(prov,'ON'));
QC_idx  = find(contains(prov,'QC'));
AC_idx  = find(contains(prov,'AC'));
EP_idx  = find(contains(prov,'EP'));

% Generate stacks for plotting
vest_stack = [vestas(ON_idx) vestas(QC_idx) vestas(AB_idx) ...
    vestas(AC_idx) vestas(BC_idx) vestas(EP_idx)];

ge_stack   = [ge(ON_idx) ge(QC_idx) ge(AB_idx) ...
    ge(AC_idx) ge(BC_idx) ge(EP_idx)];

siem_stack = [siemens(ON_idx) siemens(QC_idx) siemens(AB_idx) ...
    siemens(AC_idx) siemens(BC_idx) siemens(EP_idx)];

ener_stack = [enercon(ON_idx) enercon(QC_idx) enercon(AB_idx) ...
    enercon(AC_idx) enercon(BC_idx) enercon(EP_idx)];

senv_stack = [senvion(ON_idx) senvion(QC_idx) senvion(AB_idx) ...
    senvion(AC_idx) senvion(BC_idx) senvion(EP_idx)];

othr_stack = [other(ON_idx) other(QC_idx) other(AB_idx) ...
    other(AC_idx) other(BC_idx) other(EP_idx)];

% Generate stacked area plot:
%    x-axis = year
%    y-axis = rating
%    color  = province

subplot(3,2,1);
fig1 = area(yr(1:25),vest_stack,'EdgeColor','None');
title('Vestas');
xlim([1998 2019]);
ylim([0 4000]);
ylabel('Installed Capacity (MW)');

subplot(3,2,2);
fig2 = area(yr(1:25),ge_stack,'EdgeColor','None');
title('GE');
xlim([1998 2019]);
ylim([0 4000]);

subplot(3,2,3);
fig3 = area(yr(1:25),siem_stack,'EdgeColor','None');
title('Siemens');
xlim([1998 2019]);
ylim([0 4000]);
ylabel('Installed Capacity (MW)');

subplot(3,2,4);
fig4 = area(yr(1:25),ener_stack,'EdgeColor','None');
title('ENERCON');
xlim([1998 2019]);
ylim([0 4000]);

subplot(3,2,5);
fig5 = area(yr(1:25),senv_stack,'EdgeColor','None');
title('Senvion');
xlim([1998 2019]);
ylim([0 4000]);
xlabel('Year');
ylabel('Installed Capacity (MW)');
legend(fliplr(fig5),'EP','BC','AC','AB','QC','ON','Location','NorthWest');
legend boxoff;

subplot(3,2,6);
fig6 = area(yr(1:25),othr_stack,'Edgecolor','None');
title('Other');
xlim([1998 2019]);
ylim([0 4000]);
xlabel('Year');

% Loop through and set colormap to greyscale
clr = [5/6 5/6 5/6];
for i = 1:6
    fig1(i).FaceColor = clr;
    fig2(i).FaceColor = clr;
    fig3(i).FaceColor = clr;
    fig4(i).FaceColor = clr;
    fig5(i).FaceColor = clr;
    fig6(i).FaceColor = clr;
    clr = clr - 1/6;
end

% Window size
set(gcf,'Position',[300 200 750 600]); % [xpos ypos width height]