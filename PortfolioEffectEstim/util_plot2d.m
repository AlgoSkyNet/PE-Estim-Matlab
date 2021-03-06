% Line plot of portfolio metric (for a time series)
%
% Draws a new line plot using a time series of metric values.
% 
% 
% Usage
% 
% util_plot2d(metric,legend,Title,Subtitle,font_size,line_size,dkpanel,bw)
% 
%
% metric
%        Time series  of (time, value) returned by metric functions.*
%
% legend
%        Plot legend.*
%
% Title
%        Plot title.
%
% Subtitle
%        Plot subtitle.
%
% title_size
%        Title font size.
%
% base_size
%        Base font size.
%
% dkpanel
%        dkpanel flag.
%
% bw
%        Black and white color scheme flag.
%
% 
% Note
%
% PortfolioEffect - Matlab Interface to Quant API
% 
% Copyright (C) 2010 - 2015 Snowfall Systems, Inc.
%
%
% Examples
% 
% data_goog=importdata('data_goog.mat'); 
% data_aapl=importdata('data_aapl.mat');  
% data_spy=importdata('data_spy.mat'); 
% portfolioExample=portfolio_create('priceDataIx',data_spy); 
% portfolio_addPosition(portfolioExample,'GOOG',100,'priceData',data_goog);
% portfolio_settings(portfolioExample,'portfolioMetricsMode','price','windowLength','3600s');
% util_plot2d(position_sortinoRatio(portfolioExample,'GOOG',0.05),'Position Sortino Ratio GOOG','Title','Position Sortino Ratio')
function [plot] = util_plot2d(metric,legend,varargin)
p = inputParser;
%    defaultLegend='';
   defaultTitle = cellstr('No title');
   defaultSubtitle =cellstr('No subtitle');
   defaultTitle_size = 18;
   defaultLines_size = 1.5;
   defaultBase_size = 14;
   defaultDkpanel= false;
   defaultBw = false;
   
%    addParameter(p,'legend',defaultLegend);
   addParameter(p,'Title',defaultTitle);
   addParameter(p,'Subtitle',defaultSubtitle);
   addParameter(p,'title_size',defaultTitle_size,@isnumeric);
   addParameter(p,'lines_size',defaultLines_size,@isnumeric);   
   addParameter(p,'base_size',defaultBase_size,@isnumeric);
   addParameter(p,'dkpanel',defaultDkpanel,@islogical);
   addParameter(p,'bw',defaultBw,@islogical);
             
parse(p,varargin{:});

Data=metric(:,2);
Time=metric(:,1);
Legend=repmat(cellstr(legend), length(Data), 1);
plotData=dataset(Data,Time,Legend);
plot=util_plot2df('Data~Time',plotData,'Title',p.Results.Title,'Subtitle',p.Results.Subtitle,'title_size',p.Results.title_size,'lines_size',p.Results.lines_size,'base_size',p.Results.base_size,'dkpanel',p.Results.dkpanel,'bw',p.Results.bw);
end

