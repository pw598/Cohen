%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Find envelop over peaky, noisy signal
% Instructor: mikexcohen.com
%
%%

% create peaky, noisy signal
npnts = 5000; % signal length in points
propSpikes = .01; % proportion of points with spikes
numSpikes  =  % actual number of peaks

% select points for spikes
points2use = randperm
points2use = points2use

% generate random noise and add spikes
signal = 2*randn
signal() = ;

% compute the z-scored signal
zsignal = 


% plot the original signal
figure(1), clf
subplot(211)
plot(1:npnts,signal,'linew',2)
xlabel('Time (a.u.)'), ylabel('Amplitude (meaningless units!)')
title('Raw signal')

% plot the zscored signal
subplot(212)
plot(1:,,'s-')
xlabel('Time (a.u.)'), ylabel('Amplitude (z-normalized)')
title('Z-normalized signal')

% pick a threshold based on visual inspection
bestthresh = 1;

%% bonus: loop over possible thresholds to determine a good one

% what's a good threshold? Let's search the parameter space and find out!
threshs = (.5,3,50);

numpeaks = zeros(size(threshs));
for ti=1:length(threshs)
    % determine the number of peaks for this threshold
    numpeaks(ti) = 
end

% plot the number of peaks as a function of the thresholds
plot(threshs,numpeaks,'ks-','linew',2,'markerfacecolor','w')
xlabel('Threshold (z)'), ylabel('Number of peaks identified')

% find the threshold closest to the known number of peaks
bestthresh = 

%%

% now use that threshold to find peaks
peaktimes = 
peakvals  = 

% now interpolate across the peaks
interpsig = interp1(,,,'pchip','extrap');

% plot the interpolated signal on top of the original signal
subplot(211), hold on
plot(peaktimes,,'ro','markersize',10,'markerfacecolor','r')
plot(1:npnts,,'r')
set(gca,'ylim',[min(signal) max(signal)]*5)
zoom on

% plot only the envelope signal
subplot(212)

xlabel('Time (a.u.)')

%%
