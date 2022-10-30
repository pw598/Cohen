%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: High-pass FIR filter
% Instructor: mikexcohen.com
%
%%

% signal parameters
srate = 1000;
time  = 0:1/srate:10; % 10 seconds
npnts = length(time);

% signal is Brownian (random-walk) noise
signal = cumsum( 

% create the filter parameters
loweredge  = 10; % hz
transwidth = .15; % proportion

% filter shape is 0's and 1's for each node in the filter shape
filtershape = 

% filter frequencies vector can be specified in Hz
% then normalized to Nyquist=1
filterfrex  = 
filterorder = 40*loweredge;

% create filter kernel and apply to data
filterkernel = firls(
filterTS = filtfilt(

% compute the power spectrum of the filter kernel
filtpow = abs(fft(
% compute the frequencies vector and remove negative frequencies
hz      = linspace(
filtpow = filtpow(1:length(hz));



% plot original and filtered signal in the same plot
figure(1), clf
subplot(211)
plot(
xlabel('Time (sec.)'), ylabel('Amplitude')
title('Time domain')
legend({'Original';'Filtered'})

% plot filter kernel in the time domain
subplot(234)
plot(,'linew',2)
xlabel('Time points')
title('Filter kernel')



% plot amplitude spectrum of the filter kernel
subplot(235), hold on
plot(hz,filtpow,'ks-','linew',2,'markerfacecolor','w')

% plot the "ideal" filter specified above
plot(,filtershape,'ro-','linew',2,'markerfacecolor','w')


% dotted line corresponding to the lower edge of the filter cut-off
plot(,,'k:')

% make the plot look nicer
set(gca,'xlim',[0 loweredge*4],'ylim',[-.05 1.05])
xlabel('Frequency (Hz)'), ylabel('Filter gain')
legend({'Actual';'Ideal'})
title('Frequency response of filter')


% replot the filter gain in decibel units
subplot(236), hold on
plot(hz,,'ks-','linew',2,'markersize',10,'markerfacecolor','w')
% and again plot a vertical line for the filter edge
plot(,get(gca,'ylim'),'k:')

% plot niceties
set(gca,'xlim',[0 loweredge*4])
xlabel('Frequency (Hz)'), ylabel('Filter gain (dB)')
title('Frequency response of filter')

%%
