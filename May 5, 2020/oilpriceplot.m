function oilpriceplot
% oilpriceplot - Generates animated plot of historical WTI oil price
% 
% References:
% Post 1983 daily price data retrieved from:
%    https://ca.investing.com/commodities/crude-oil-historical-data
% Pre 1983 yearly price data retrieved from:
%    https://inflationdata.com/articles/inflation-adjusted-prices/historical-crude-oil-prices-table/
% Historical event dates:
%    http://www.energybc.ca/cache/oil3/www.wtrg.com/prices.htm
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
% Data files required: WTIprice.csv
% Subfunctions: none
%
% See also: N/A
% Author: Will Noel
% email: wnoel@ualberta.ca
% May 2020; Last revision: 05-May-2020
%------------- BEGIN CODE --------------

% Read in .csv datafile, extract date, price, and year
data = readtable('WTIprice.csv');
x    = data.Date;
y    = data.Price;
time = unique(year(x));

% Start animated plot
h    = animatedline;

% Maximize plot window
set(gcf, 'WindowState', 'maximized');

% Deine x tick labels
xticks(linspace(min(datenum(x)),max(datenum(x)),length(time)/5+1));
xticklabels(min(time)-1:5:max(time));
xtickangle(45);

% Set title, x, and y labels
title('WTI Crude Oil Price');
ylabel('Price ($/bbl)');
xlabel('Year');

% Plot pre 1983 data
for k = 1:37
    addpoints(h,datenum(x(k)),y(k));
    drawnow; 
    pause(0.05);
end

% Plot post 1983 data
for k = 37:26:length(x)-25
    addpoints(h,datenum(x(k:k+25)),y(k:k+25));
    drawnow;
end
