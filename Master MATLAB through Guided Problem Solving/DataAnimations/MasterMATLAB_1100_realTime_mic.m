%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Data animations
%      VIDEO: Real-time audio spectrum from mic
% Instructor: mikexcohen.com
%
%%

% recording and analysis parameters
srate = 44100/4;
time  = 0:1/srate:1-1/srate;
n     = length(time);
hz    = linspace(0,srate,n);

% setup the plot
figure(1), clf

% time domain
subplot(211)
timeh = plot(
set(gca,'ylim',[-1 1]/7)
xlabel('Time (sec.)'), ylabel('Amplitude')
title('Time domain')

% frequency domain
subplot(212)
freqh = plot(hz,
set(gca,'xlim',[0 500],'ylim',[0 5]*1e-6)
xlabel('Frequency (Hz)'), ylabel('Power')
title('Frequency domain')


% setup recorder
auddat = audiorecorder

% start recorder and full the buffer

pause(1.1);

% let it run until explicitly quit with Ctrl-c
while 1
    
    % grab data from previous second
    data = 
    data = 
    
    % update plots
    set(timeh,'YData',);
    set(freqh,'YData',);
    
    pause(.1)
end

% stop the recording
stop(auddat);


%%
