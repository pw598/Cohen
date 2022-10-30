%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Line noise notch filter
% Instructor: mikexcohen.com
%
%%

% load dataset
load EEGrestingState.mat

% create a time vector
npnts = length(eegdata);
time  = ;

% compute power spectrum
eegpow = 

% compute vector of frequencies
hz = linspace(0,srate/2,);

% show in a plot
figure(1), clf
subplot(211)
plot(time,eegdata,'k')
xlabel('Time (sec.)'), ylabel('Amplitude (\muV)')

subplot(212)
plot(hz,,'k')
xlabel('Frequency (Hz)'), ylabel('Power (\muV^2)')
zoom on

%% now for filtering

% filter parameters
notchcenter = 50; % Hz
notchwidth  = .5; % Hz on either side


% filter bands, normalized to Nyquist
bands = [ frex2notch-notchwidth frex2notch ];

% compute filter kernel using fir1
filtk = fir1(2000,bands,

% apply the filter to the data
eegdataF = filtfilt

% compute power spectrum
eegpowF = abs(fft(  )/npnts ).^;


% plot the notch-filtered time series
subplot(211), hold on
plot(time,eegdataF,'r')
xlabel('Time (sec.)'), ylabel('Amplitude (\muV)')

% plot the power spectrum
subplot(212), hold on
plot(hz,eegpowF,'r')
xlabel('Frequency (Hz)'), ylabel('Power (\muV^2)')

%%
