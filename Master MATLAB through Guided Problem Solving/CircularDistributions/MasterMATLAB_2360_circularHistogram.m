%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Circular distributions and analyses
%      VIDEO: Circular histogram
% Instructor: mikexcohen.com
%
%%

% number of time points
n = 100;

% generate phase-uniform distribution
sig1 = 

% generate phase-nonuniform distribution
sig2 = 

% extract phase angle time series from both signals
phs1 = 
phs2 = 




% plot the time series and phase angles
figure(1), clf
subplot(221)
plot
xlabel('Time (a.u.)'), ylabel('amplitude')

subplot(222)
plot
xlabel('Time (a.u.)'), ylabel('angles (rad.)')


% now show the distributions
subplot(223)
[t,r] = % rose to generate histogram
h = 
set(h,'linew',2,'color','r')
title('Signal 1 phase dist.')

subplot(224)
[t,r] = rose
h = polarplot(
set(h,'linew',2,'color','k')
title('Signal 2 phase dist.')

%%
