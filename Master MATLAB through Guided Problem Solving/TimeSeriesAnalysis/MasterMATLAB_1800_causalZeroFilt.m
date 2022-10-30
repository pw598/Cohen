%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Causal vs. zero-phase-shift filter
% Instructor: mikexcohen.com
%
%%

% signal is Morlet wavelet
srate  = 1000; % Hz
time   = -2:1/srate:2;
frequ  = 5; % center frequency of wavelet
signal = 


% create the filter parameters
centfreq   = ; % hz
transwidth = .2; % proportion

% filter shape is 0's and 1's
filtershape = [ 0 0 0 0 0 0 ];

% filter frequencies vector can be specified in Hz 
% then normalized to Nyquist=1
filterfrex  = [  ];
filterorder = 20*centfreq;

% create filter kernel and apply to data
filterkernel = firls(,,);

% forward causal filter
filterTSF = filter
% then filter backwards
filterTSB = filter
% then flip again
filterTS = 


% plot everything
figure(1), clf, hold on
plot(time,signal,'b','linew',3)
plot(time,filterTSF,'r','linew',2)
plot(time,filterTSB,'r--','linew',2)
plot(time,filterTS,'k','linew',3)

xlabel('Time (sec.)'), ylabel('Amplitude')
legend({'Signal';'forward filter';'reversed';'final filter'})
zoom on

%%
