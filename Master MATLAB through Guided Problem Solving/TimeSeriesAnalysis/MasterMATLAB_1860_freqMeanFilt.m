%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Frequency-domain mean filter
% Instructor: mikexcohen.com
%
%%

% create noisy signal
n = 10000;
signal = randn(n,1);

% filter kernel size
k = 30; % acually creates a k*2+1 filter



% time-domain running-mean filter
tic; % start timer
filtsigTD = zeros( size(signal) );
for ti=
    filtsigTD(ti) = 
end
timr(1) = toc;



% now with convolution
tic; % start timer
kernel = ones
nConv  = ; % N+M-1

sigX = fft(,);
krnX = fft(,);

filtsigFD = ifft( 
filtsigFD = filtsigFD % cut off the "wings" of convolution
timr(2) = toc; % end timer


% plot the signal and filtered signals
figure(1), clf
subplot(211)
% bonus: plot three signals at the same time without a loop:


zoom on
legend({'Original';'Time-domain filter';'Frequency-domain filter'})
title([ 'Time and frequency domain filtered signals correlate at r=' num2str(corr(filtsigFD,filtsigTD)) ])


% plot computation time
subplot(212)

set(gca,'xlim',[.5 2.5],'xtick',1:2,'XTickLabel',{'Time';'Freq'})
ylabel('Computation time (s)')

%%
