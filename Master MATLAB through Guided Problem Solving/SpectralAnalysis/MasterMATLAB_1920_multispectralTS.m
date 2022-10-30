%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Spectral analysis
%      VIDEO: Create multispectral time series
% Instructor: mikexcohen.com
%
%%

% set parameters
srate = 1000; % sampling rate in Hz
time  = -2:1/srate:2;
npnts = length(time);
frex  = [  ]; % frequencies in Hz
ampl  = [  ]; % frequencies in Hz

% initialize signal
signal = zeros(1,npnts);

% loop over frequencies
for fi=1:length(frex)
    
    % amplitude (scalar or interpolated noise)
    AM = 
    
    % add new sine component to signal
    signal =  + ;
end

% plot
figure(1), clf
plot(time,signal,'k','linew',2)
xlabel('Time (s)'), ylabel('Amplitude (a.u.)')

%%
