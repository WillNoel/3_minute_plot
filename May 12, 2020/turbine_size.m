function turbine_size
% turbine_size - Generates plot of the size of Canadian wind turbines over
% time
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
% Data files required: turbine_data.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 12-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract data, close table
data   = readtable('turbine_data.csv');
year   = data.Year;
height = data.Height;
diamtr = data.Diameter;
%clear data

% Find average height and diamtr for each year
unique_year = unique(year);            % Years where new turbines built
n            = length(unique_year);    % Number of unique years
avg_height   = ones(n,1);              % Initialize vector size
avg_diamtr   = ones(n,1);
turb_count   = ones(n,1);

for i = 1:1:n
    idx = find(year==unique_year(i));    
    avg_height(i) = mean(height(idx));
    avg_diamtr(i) = mean(diamtr(idx));
    turb_count(i) = nnz(idx);
end

% Generate scatter plot:
%    x-axis = year
%    y-axis = height
%    size   = diameter
%    color  = rating
h = scatter(unique_year,avg_height,1,turb_count,'Filled','MarkerEdgeColor','k');
xlabel('Year','FontSize',10);
ylabel('Hub Height (m)','FontSize',10);
xlim([1990 2025]);
ylim([0 160]);
set(gcf,'Position',[200,500,900,300]);
title('Average Size and Number of Builds by Year');
clr = colorbar; ylabel(clr,'Turbines Erected per Year');
legend('Rotor Diameter (m)', 'location', 'northwest');
legend boxoff;
colormap(flipud(gray));

% Obtain the axes size to scale markers
currentunits = get(gca,'Units');
set(gca, 'Units', 'Points');
axpos = get(gca,'Position');
set(gca, 'Units', currentunits);
markerWidth = avg_diamtr./diff(ylim)*axpos(4);
set(h, 'SizeData', 0.25.*pi.*markerWidth.^2);

