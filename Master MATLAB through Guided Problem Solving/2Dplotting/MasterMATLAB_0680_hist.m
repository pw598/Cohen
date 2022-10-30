%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Histograms
% Instructor: mikexcohen.com
%
%%

% number of data points
n = 1000;

% number of histogram bins
k = 

% generate log-normal distribution
data = exp( 


figure(1), clf

% one way to show a histogram
histogram

% another option
[y,x] = hist
plot(x,y,'s-','linew',2,'markersize',16,'markerfacecolor','g')
xlabel('Value')
ylabel('Count')

%% try the Freedman-Diaconis rule

r = 
b = ceil(  );

histogram(data,b)
xlabel('Value'), ylabel('Count')
title([ 'F-D "rule" using ' num2str(b) ' bins' ])

%% movie showing histograms with increasing bins

bins2try = round( linspace(5,n/2,30) );

h = plot(x,y,'s-','linew',2,'markersize',16,'markerfacecolor','g');
xlabel('Value'), ylabel('Count')

for bini=1:length(bins2try)
    % use hist to get histogram graph data for this bin count
    
    
    % update xdata and ydata
    
    
    % update title
    
    pause(.5)
end    

%%
