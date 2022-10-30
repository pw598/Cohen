%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Fractal time series and images
%      VIDEO: The devil's staircase
% Instructor: mikexcohen.com
%
%%

% depth (k) and x-initialization
k = 4; % best to stay below 12
x = [0 1];

% plot the first row (k=0)
figure(1), clf, hold on, zoom on
plot(reshape(x,2,length(x)/2),repmat([k k]',1,length(x)/2),'k-','linew',5,'markerfacecolor','k')

% loop through depth (k) and compute/plot
for i=1:
    
    % recreate x and add new elements
    x = 
    
    % draw a new line, similar to above
    
end

% adjust axis limits
set(gca,'xlim',[],'ylim',[])

%% the devil's staircase

% define a vector from 0-1 to plot against x
n = 

% now for plotting
figure(2), clf
plot(,,'k','linew',3)
axis square
zoom on

% bonus: also inspect function derivative


%%
