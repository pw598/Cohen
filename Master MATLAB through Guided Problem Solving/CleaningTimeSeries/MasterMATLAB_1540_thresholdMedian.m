%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning univariate time series
%      VIDEO: Threshold median filter
% Instructor: mikexcohen.com
%
%%

% create signal
srate = 769; % Hz
time  = 0:1/srate:3;
n     = length(time);

% proportion of time points to replace with noise
propnoise = .05;

% find noise points
noisepnts = randperm(n);
noisepnts = 

% generate signal and replace points with noise
signal = sin(2*pi*5*time);
signal(noisepnts) = 


% use hist to pick threshold
figure(1), clf
hist(
zoom on

% visual-picked threshold
threshold = 


% bonus: data-driven threshold based on derivative of sorted values



% find data values above the threshold
suprathresh = 

% initialize filtered signal
filtsig = signal;

% loop through suprathreshold points and set to median of k
k = 20; % actual window is k*2+1
for ti=1:length(suprathresh)
    
    % compute median of surrounding points
    filtsig(suprathresh(ti)) = 
end


% plot
figure(2), clf
plot(time,signal, time,filtsig, 'linew',2)
zoom on

%%
