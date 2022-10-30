%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Convolution
% Instructor: mikexcohen.com
%
%%

% number of time points
n = 10000;

% signal is Brownian motion
signal = ;

% kernel is a Gaussian
k = 100;
kernel = 

% flip the kernel backwards


% plot the kernel
figure(1), clf
subplot(223)
plot(,,'m','linew',2)
title('Convolution kernel')
xlabel('Time points'), ylabel('Amplitude')


% now for convolution:
convres = zeros(size(signal));
for ti=
    
    % part of the signal
    littlesig = 
    
    % convolution at this point is the dot product
    convres(ti) = 
end
    
% plot the signal and result of convolution
subplot(211)
plot(1:n,signal, 1:n,convres,'linew',3)
xlabel('Time (a.u.)'), ylabel('Amplitude')
title('Time domain')

%% now in the frequency domain

% FFTs of signal and kernel
nconv = 
sigX = 
krnX = fft(
hz   = linspace(0,1,nconv); % normalized units

% convolution is inverse of multiplied spectra
convres2 = 
convres2 = convres2(k+1:end-k); % cut off "wings"


% plot normalized amplitude spectra
subplot(224)
plot(hz,,'linew',2)
hold on
plot(hz,,'linew',2)
set(gca,'xlim',[0 .2])
legend({'Signal';'Kernel'})
xlabel('Frequency (norm.)'), ylabel('Amplitude (norm.)')
title('Frequency domain')


% plot the result of convolution
subplot(211), hold on
plot
legend({'Signal';'Conv result (time)';'Conv result (freq)'})

%%
