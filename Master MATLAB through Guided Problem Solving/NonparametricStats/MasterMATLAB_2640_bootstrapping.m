%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: Bootstrapping to define confidence intervals
% Instructor: mikexcohen.com
%
%%

% create data
N = 30;
data = 

% number of bootstraps
nstraps = 1000;




% show a histogram of the data
figure(1), clf
subplot
hist(data)

% vertical line for the observed mean
plot


% initialize bootstrap distribution
bootmean = zeros(

% the loop that does bootstrapping
for booti=1:nstraps
    
    % pick values with replacement
    
    
    % compute mean of that sample
    bootmean(booti) = 
end

% show a histogram of the bootstrapped mean values

hist
xlabel('Values')

% get confidence intervals
ni95 = prctile


% add lines for the sample mean and confidence intervals


% some labels and legend
ylabel('Count')
legend({'data';'Mean';'95% CI'})


%%
