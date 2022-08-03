%%
%     COURSE: Solved challenges in neural time series analysis
%    SECTION: Inferrential statistics
%      VIDEO: Project 7-1: Effects of noise smoothness on cluster correction
% Instructor: sincxpress.com
%
%%

% generic simulation parameters


% convert p-value to z-value (note: use 1.96 for p<.05 2-tailed without stats-toolbox)



% signal-specific parameters


% create two "pure" signals


%% create dataset with noise

% noise parameters
noisestd = 2;
peakfreq = 4;
fwhm     = 5;



%%% create frequency-domain Gaussian



% create dataset: pure signal plus noise
for triali=1:ntrials
    
    % data1
    
    
    % data2
end


% plot
figure(1), clf
subplot(211)
plot(time,pure1, time,pure2)
ylabel('Amplitude (a.u.)')
legend({'signal1';'signal2'})
title('Pure signals')

subplot(212)
plot(time,mean(data1,2), time,mean(data2,2))
ylabel('Amplitude (a.u.)')
legend({'data1';'data2'})
title([ 'Signals + noise (average of ' num2str(ntrials) ' trials)' ])


%% permutation testing

% put data together into one matrix with 2N trials

% generate true condition labels


for permi = 1:nPerms
    
    % shuffle condition label vector
    
    % compute and store difference time series
end

%% find cluster sizes under the null hypothesis

% initialize cluster sizes from permutation
clustsizes = zeros(nPerms,1);

for permi=1:nPerms
    
    % compute z-score difference
    
    % threshold
    
    % identify clusters
    
    % find cluster sizes
end

% compute cluster threshold


% show distribution of cluster sizes
figure(2), clf
histogram(clustsizes)
xlabel('Cluster size (time points)'), ylabel('Count')

%% remove small clusters from real thresholded data

% compute z-score difference

% recompute thresholded time series

% plot that
figure(3), clf
subplot(311), hold on
plot(time,zdiff,'k')
plot(time(logical(zthresh)), zthresh(logical(zthresh)),'yo','markerfacecolor','r')
ylabel('Z value')
title('Statistical results, uncorrected')
legend({'Difference';[ 'p<' num2str(pval) ', 2-tailed' ]})




% find islands

% find and remove any subthreshold islands

% now plot that
subplot(312), hold on
plot(time,zdiff,'k')
plot(time(logical(zthresh)), zthresh(logical(zthresh)),'yo','markerfacecolor','r')
ylabel('Z value')
title('Statistical results, cluster-corrected')
legend({'Difference';[ 'p<' num2str(pval) ', 2-tailed' ]})



% make the plot look a bit nicer using patches
subplot(313), cla, hold on

xlabel('Time (s)'), ylabel('Z value')
title('Statistical results, corrected')
legend({'Difference';[ 'p<' num2str(pval) ', 2-tailed' ]})

%% done!
