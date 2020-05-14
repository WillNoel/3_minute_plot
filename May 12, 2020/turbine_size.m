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
rating = data.Rating;
clear data

% Find average height and diamtr for each year
unique_year = unique(year);            % Years where new turbines built
n            = length(unique_year);    % Number of unique years
avg_height   = ones(n,1);              % Initialize vector size
avg_diamtr   = ones(n,1);
inst_capac   = ones(n,1);

for i = 1:1:n
    idx = find(year==unique_year(i));
    inst_capac(i) = sum(rating(idx));
    % Capacity weighted averages
    avg_height(i) = mean(rating(idx).'*height(idx))./inst_capac(i);
    avg_diamtr(i) = mean(rating(idx).'*diamtr(idx))./inst_capac(i);
end

% Flip vectors so smaller bubbles aren't hidden by larger ones
unique_year = flipud(unique_year);
avg_height  = flipud(avg_height);
inst_capac  = flipud(inst_capac);
avg_diamtr  = flipud(avg_diamtr);

% Generate scatter plot:
%    x-axis = year
%    y-axis = height
%    size   = diameter
%    color  = rating
h = scatter(unique_year,avg_height,1,inst_capac./1000,'Filled',...
    'MarkerEdgeColor','k');
% Axes labels and limits
xlabel('Year','FontSize',10);
ylabel({'Capacity-Weighted';'Annual Average Hub Height (m)'},'FontSize',10);
xlim([1990 2025]);
ylim([0 200]);
title('Average Size and Installed Capacity by Year');
% Window size
set(gcf,'Position',[200 500 900 300]); % [xpos ypos width height]
% Colorbar
clr = colorbar;
clr.Label.String = 'Installed Capacity (MW)';
clr.Location = 'South';
clr.Position = [0.15 0.77 0.3 0.05]; % [xpos ypos width height]
pos = get(clr,'Position');
clr.Label.Position = [pos(1)+1000 pos(2)+1.5];
set(clr, 'YAxisLocation','bottom') % tick labels to bottom
colormap(flipud(gray));

% Obtain the axes units to scale bubble size
currentunits = get(gca,'Units');
set(gca, 'Units', 'Points');
axpos = get(gca,'Position');
set(gca, 'Units', currentunits);
markerWidth = avg_diamtr./diff(ylim)*axpos(4);
set(h,'SizeData', 0.25.*pi.*markerWidth.^2);

% Label two of the bubbles for scale
lbl_1 = sprintf('\\oslash%2.0f m, h = %2.0f m\n           \\downarrow',...
    avg_diamtr(n-1),avg_height(n-1));
lbl_n = sprintf('\\oslash%3.0f m, h = %2.0f m\n            \\downarrow',...
    avg_diamtr(1),avg_height(1));
text(unique_year(n-1)-2.2,avg_height(n-1)+avg_diamtr(n-1)/1.27,lbl_1);
text(unique_year(1)-2.2,avg_height(1)+avg_diamtr(1)/1.8,lbl_n);










