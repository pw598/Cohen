%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Spectral analysis
%      VIDEO: The Hilbert transform
% Instructor: mikexcohen.com
%
%%

% number of points
n = 300;

% signal is a sine wave plus low-amplitude noise
signal = sin(  ) + ;

% 1) take FFT
fc = fft(signal);

% 2) create a copy that is multiplied by the complex operator
complexf = 

% 3) find indices of positive and negative frequencies
posF = 
negF = 

% 4) rotate Fourier coefficients
fc(posF) = fc(posF) + 
fc(negF) = fc(negF) + 

% 5) take inverse FFT
hilbertx = 



% compare with Matlab function hilbert
hilbertm = hilbert(signal);


% plot the real parts
figure(1), clf
subplot(311), hold on
plot(1:n,signal,'k','linew',2)
plot(1:n,,'rs','markerfacecolor','r')
title('Real part')


% plot the magnitudes
subplot(312), hold on
plot(1:n,,'k','linew',2)
plot(1:n,,'rs','markerfacecolor','r')
title('Amplitude time series')


% plot the phase angles
subplot(313), hold on
plot(1:n,,'k','linew',2)
plot(1:n,,'rs','markerfacecolor','r')
title('Phase angle time series')
xlabel('Time (a.u.)')

%%
