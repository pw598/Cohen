%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning univariate time series
%      VIDEO: Running mean filter
% Instructor: mikexcohen.com
%
%%

% create signal
srate = 768; % Hz
time  = 0:1/srate:3;
n     = length(time);
p     = 15; % poles for random interpolation

% noise level, measured in standard deviations
noiseamp = 5; 

% amplitude modulator and noise level
ampl   = % use interp1 to create a p-pole time series
noise  = % random numbers scaled by noiseamp
signal = % ampl times sine wave plus noise

% initialize filtered signal vector
filtsig = zeros(size(signal));

% implement the running mean filter
k = 20; % filter window is actually k*2+1
for i=k:n-k
    % each point is the average of k surrounding points
    filtsig(i) = 
end

% convert window size in indices to window size in ms
windowsize = 


% plot the noisy and filtered signals
figure(1), clf, hold on
plot(time,

% draw a patch to indicate the window size
tidx = 
ylim = get(gca,'ylim');
patch(time(),ylim(),'k','facealpha',.25,'linestyle','none')
plot(time([tidx tidx]),ylim,'k--')

xlabel('Time (sec.)'), ylabel('Amplitude')
title([ 'Running-mean filter with a k=' num2str(round(windowsize)) '-ms filter' ])
legend({'Signal';'Filtered';'Window';'window center'})

zoom on

%%
