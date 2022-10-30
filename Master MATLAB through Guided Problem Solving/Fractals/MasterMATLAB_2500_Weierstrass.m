%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Fractal time series and images
%      VIDEO: Weierstrass functions
% Instructor: mikexcohen.com
%
%%

% time vector
srate = 5000; % in Hz
x = -3:1/srate:3;

% beta parameter


% number of iterations to sum


% loop over iterations and compute function
f = zeros(size(x));
for i=1:n
    f = 
end

% compute the amplitude spectrum
hz = linspace(0,srate/2,
fp = abs(fft(f)/length(f));


% plot the time-domain signal
figure(1), clf
subplot(211)
plot(,,'k','linew',1)
xlabel('Time (sec.)')
set(gca,'xlim',x)
title('Time domain')

% plot the amplitude spectrum
subplot(212)
plot(hz,,'k','linew',)
xlabel('Frequency (Hz)')
title('Frequency domain')
set(gca,'xlim',[0 120])

%% bonus: find peaks

% find peaks
peeks = 
% (hint: eliminate small peaks?)



figure(2), clf
subplot(211)
% plot spectrum with peaks
plot(,,'k','linew',2), hold on
plot(,,'ro','markerfacecolor','r')
xlabel('Frequency (Hz)'), ylabel('Amplitude (z-norm)')


% now plot peak frequencies and relationship to b-parameter
subplot(212)
plot(,'rs-','linew',2,'markersize',18,'markerfacecolor','w')
hold on
plot(,'ks-','linew',2,'markersize',10,'markerfacecolor','y')

xlabel('Peak number')
ylabel('Frequency (Hz)')
set(gca,'xtick',1:length(peeks))
legend({'Empirical';'Analytic ()'})

%%
