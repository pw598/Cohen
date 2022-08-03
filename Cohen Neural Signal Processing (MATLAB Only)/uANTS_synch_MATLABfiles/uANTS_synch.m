%%
%   COURSE: Neural signal processing and analysis: Zero to hero
%  SECTION: Synchronization
%  TEACHER: Mike X Cohen, sincxpress.com
%


%% 
% 
%  VIDEO: ISPC (Inter-site phase clustering)
% 
% 


% load in V1 mouse data
load v1_laminar

%% setup connectivity parameters

% The goal here is to explore the mechanism of phase synchronization.
% extract phase angle time series from two channels from trial 1 at 8 Hz.


% channels for connectivity
chan1idx = 1;
chan2idx = 8;


% create a complex Morlet wavelet (don't forget to plot the wavelet!!!)
cent_freq = 8;
time      = -1.5:1/srate:15;
s         = 8/(2*pi*cent_freq);
wavelet   = exp(2*1i*pi*cent_freq.*time) .* exp(-time.^2./(2*s^2));
half_wavN = (length(time)-1)/2;

% FFT parameters
nWave = length(time);
nData = size(csd,2);
nConv = nWave + nData - 1;

% FFT of wavelet (check nfft)
waveletX = fft(wavelet,nWave);
waveletX = waveletX ./ max(waveletX);

% initialize output time-frequency data
phase_data = zeros(
real_data  = zeros(



% analytic signal of channel 1
dataX = fft(
as = ifft(waveletX.*dataX,nConv);
as = as(half_wavN+1:end-half_wavN);

% collect real and phase data
phase_data(1,:) = angle(as); % extract phase angles
real_data(1,:)  = real(as);  % extract the real part (projection onto real axis)

% analytic signal of channel 1
dataX = fft(
as = ifft(waveletX.*dataX,nConv);
as = as(half_wavN+1:end-half_wavN);

% collect real and phase data
phase_data(2,:) = angle(as);
real_data(2,:)  = real(as);

%% setup figure and define plot handles

% note: This cell is just setting up the figure for the following cell. 
%       You can run it and move on.


% open and name figure
figure(1), clf
set(gcf,'Number','off','Name','Movie magic minimizes the magic.');

% draw the filtered signals
subplot(221)
filterplotH1 = plot(timevec(1),real_data(1,1),'b');
hold on
filterplotH2 = plot(timevec(1),real_data(2,1),'m');
set(gca,'xlim',[timevec(1) timevec(end)],'ylim',[min(real_data(:)) max(real_data(:))])
xlabel('Time (ms)')
ylabel('Voltage (\muV)')
title([ 'Filtered signal at ' num2str(cent_freq) ' Hz' ])

% draw the phase angle time series
subplot(222)
phaseanglesH1 = plot(timevec(1),phase_data(1,1),'b');
hold on
phaseanglesH2 = plot(timevec(1),phase_data(2,1),'m');
set(gca,'xlim',[timevec(1) timevec(end)],'ylim',[-pi pi]*1.1)
xlabel('Time (ms)')
ylabel('Phase angle (radian)')
title('Phase angle time series')

% draw phase angles in polar space
subplot(223)
polar2chanH1 = polar([zeros(1,1) phase_data(1,1)]',repmat([0 1],1,1)','b');
hold on
polar2chanH2 = polar([zeros(1,1) phase_data(2,1)]',repmat([0 1],1,1)','m');
title('Phase angles from two channels')

% draw phase angle differences in polar space
subplot(224)
polarAngleDiffH = polar([zeros(1,1) phase_data(2,1)-phase_data(1,1)]',repmat([0 1],1,1)','k');
title('Phase angle differences from two channels')

%% now update plots at each timestep

for ti=1:5:length(timevec)
    
    % update filtered signals
    set(filterplotH1,'XData',timevec(1:ti),'YData',real_data(1,1:ti))
    set(filterplotH2,'XData',timevec(1:ti),'YData',real_data(2,1:ti))
    
    % update cartesian plot of phase angles
    set(phaseanglesH1,'XData',timevec(1:ti),'YData',phase_data(1,1:ti))
    set(phaseanglesH2,'XData',timevec(1:ti),'YData',phase_data(2,1:ti))
    
    subplot(223), cla
    polar([zeros(1,ti) phase_data(1,1:ti)]',repmat([0 1],1,ti)','b');
    hold on
    polar([zeros(1,ti) phase_data(2,1:ti)]',repmat([0 1],1,ti)','m');
    
    subplot(224), cla
    polar([zeros(1,ti) phase_data(2,1:ti)-phase_data(1,1:ti)]',repmat([0 1],1,ti)','k');
    
    drawnow
end

%% now quantify phase synchronization between the two channels

% phase angle differences
phase_angle_differences = 

% euler representation of angles
euler_phase_differences = 

% mean vector (in complex space)
mean_complex_vector = 

% length of mean vector (this is the "M" from Me^ik, and is the measure of phase synchronization)
phase_synchronization = 

disp([ 'Synchronization between ' num2str(chan1idx) ' and ' num2str(chan2idx) ' is ' num2str(phase_synchronization) '!' ])

% of course, this could all be done on one line:
phase_synchronization = 

% notice that the order of subtraction is meaningless (see below), which means that this measure of synchronization is non-directional!
phase_synchronization_backwards = 


% now plot mean vector
subplot(224)
hold on
h = polar([0 angle(mean_complex_vector)],[0 phase_synchronization]);
set(h,'linewidth',6,'color','g')



%% 
% 
%  VIDEO: Laplacian in simulated EEG data
% 
% 


% The goal here is to build intuition for the Laplacian as a high-pass
% spatial filter using simulated EEG data.

clear
load sampleEEGdata.mat

chan1 = 'pz';
chan2 = 'cz';

chan1idx = strcmpi(chan1,{EEG.chanlocs.labels});
chan2idx = strcmpi(chan2,{EEG.chanlocs.labels});


% compute inter-channel distances
eucdist = zeros(2,64);
for chani=1:EEG.nbchan
    eucdist(1,chani) = sqrt( (EEG.chanlocs(chani).X-EEG.chanlocs(chan1idx).X)^2 + (EEG.chanlocs(chani).Y-EEG.chanlocs(chan1idx).Y)^2 + (EEG.chanlocs(chani).Z-EEG.chanlocs(chan1idx).Z)^2 );
    eucdist(2,chani) 
end

% generate low- and high- spatial frequency activity
lo_spatfreq = 50*exp(- (eucdist(1,:).^2)/ 300000 ); 
hi_spatfreq =    exp(- (eucdist(2,:).^2)/   3000 );


% compute Laplacian of summed activity
surf_lap = laplacian_perrinX(hi_spatfreq+lo_spatfreq,[EEG.chanlocs.X],[EEG.chanlocs.Y],[EEG.chanlocs.Z]);


% and plot
figure(2), clf
subplot(221)
topoplotIndie(lo_spatfreq,EEG.chanlocs,'numcontour',0);
title('Low spatial frequency feature')

subplot(222)
topoplotIndie(hi_spatfreq,EEG.chanlocs,'numcontour',0);
title('High spatial frequency features')

subplot(223)
topoplotIndie(,EEG.chanlocs,'numcontour',0);
title('Low+high features')

subplot(224)
topoplotIndie(surf_lap,EEG.chanlocs,'numcontour',0);
title('Laplacian of low+high features')



%% 
% 
%  VIDEO: Laplacian in real EEG data
% 
% 

% Now we will apply the Laplacian to real EEG data. We'll look at the
% topographical maps and ERPs before vs. after the Laplacian.


clear
load sampleEEGdata.mat

% pick a time point for the topoplot, and pick a channel for the ERPs
time2plot = 250; % ms
chan2plot = 'cz';


% convert to indices
tidx = dsearchn(EEG.times',time2plot);
chanidx = strcmpi({EEG.chanlocs.labels},chan2plot);


% Compute the laplacian and store as a new field in the EEG structure.
EEG.lap = laplacian_perrinX(


% The voltage and Laplacian data are in different scales. To compare them
% directly, they need to be independently normalized (z-transform).
voltERP = mean(EEG.data(chanidx,:,:),3);
voltERP = 

lapERP = mean(EEG.lap(chanidx,:,:),3);
lapERP = 



% now plot
figure(5), clf
subplot(221)
topoplotIndie(mean(EEG.data(:,tidx,:),3),EEG.chanlocs,'electrodes','labels','numcontour',0);
title([ 'Voltage (' num2str(time2plot) ' ms)' ])

subplot(222)
topoplotIndie(mean(EEG.lap(:,tidx,:),3),EEG.chanlocs,'electrodes','numbers','numcontour',0);
title([ 'Laplacian (' num2str(time2plot) ' ms)' ])

subplot(212)
plot(EEG.times,voltERP, EEG.times,voltERP,'linew',2)
set(gca,'xlim',[-300 1200])
legend({'Voltage';'Laplacian'})
title([ 'ERP from channel ' chan2plot ])
xlabel('Time (ms)'), ylabel('Data (z-score)')

%%% QUESTION:
%   Based on looking at the topoplots, pick an electrode that you think
%   will look (1) very different, and (2) very similar, for voltage and
%   Laplacian. Then show ERPs from those channels. Why do time courses 
%   from some channels look more similar than time courses from other
%   channels?



%% 
% 
%  VIDEO: Phase-lag index
% 
% 


N = 200;
pfilled = .3;
centphase = pi/4;

% strength of clustering and phase angle, PLI shown in color
phase_angles = linspace(centphase-pfilled*pi,centphase+pfilled*pi,N);


%%% compute PLI:
% "eulerize" the phase angle differences
cdd = 

% project the phase angle differences onto the imaginary axis
cdi = 

% take the sign of those projections
cdis = 

% take the average sign
cdism = 

% we can about the magnitude of the average
pli = 


% for reference, compute ISPC
ispc = 

figure(6), clf
polarplot([zeros(1,N); phase_angles],[zeros(1,N); ones(1,N)],'k')
title([ 'PLI = ' num2str(pli) ', ITPC = ' num2str(ispc) ])

%% flesh out the space

pfilledrange = linspace(0,1,40);
centphases   = linspace(0,2*pi,30);

% initialize
pli = zeros(length(pfilledrange),length(centphases));
ispc = zeros(length(pfilledrange),length(centphases));


for pfilli=1:length(pfilledrange)
    for centi=1:length(centphases)
        
        pfilled = pfilledrange(pfilli);
        centphase = centphases(centi);
        
        % strength of clustering and phase angle, PLI shown in color
        phase_angles = linspace(centphase-pfilled*pi,centphase+pfilled*pi,N);
        
        % eulerized phase angle differences
        cdd  = exp(1i*phase_angles);
        
        % compute the rest of the PLI in one line
        pli(pfilli,centi)  = 
        
        ispc(pfilli,centi) = abs(mean(cdd));
        
    end
end


figure(7), clf
subplot(121)
imagesc(centphases,pfilledrange,pli)
axis xy, axis square
ylabel('Proportion filled'), xlabel('Phase angle')
title('PLI')

subplot(122)
imagesc(centphases,pfilledrange,ispc)
axis xy, axis square
ylabel('Proportion filled'), xlabel('Phase angle')
title('ITPC')
colormap hot
colorbar('east')


%% 
% 
%  VIDEO: Phase synchronization in voltage and Laplacian EEG data
% 
% 


%% First with voltage data
%  The goal here is to compute ISPC and PLI on the EEG voltage data,
%  between two channels over a range of frequencies.

clear
load sampleEEGdata.mat


% pick two channels
chan1 = 'FCz';
chan2 = 'POz';


% frequency parameters
min_freq =  2;
max_freq = 40;
num_frex = 

% set range for variable number of wavelet cycles
fwhm = linspace(.3,.1,num_frex);

% other wavelet parameters
frex  = logspace((min_freq),(max_freq),num_frex); % HINT: check these frequencies!
time  = -2:1/EEG.srate:2;
half_wave = (length(time)-1)/2;

% FFT parameters
nWave = length(time);
nData = EEG.pnts*EEG.trials;
nConv = nWave+nData-1;


% FFT of data (doesn't change on frequency iteration)
data1X = fft( reshape(EEG.data(strcmpi(chan1,{EEG.chanlocs.labels}),:,:),1,nData) ,nConv);
data2X = fft( reshape(EEG.data(strcmpi(chan2,{EEG.chanlocs.labels}),:,:),1,nData) ,nConv);

% initialize output time-frequency data
ispc = 
pli  = 

% loop over frequencies
for fi=1:num_frex
    
    % create wavelet and get its FFT
    wavelet  = exp(2*1i*pi*frex(fi).*time) .* exp( -4*log(2)*time.^2 / fwhm(fi)^2 );
    waveletX = fft(wavelet,nConv);
    waveletX = waveletX./max(waveletX); % is this line necessary?
    
    
    % convolution for chan1
    as1 = ifft(waveletX.*data1X,nConv); % is nConv necessary here?
    as1 = as1(half_wave+1:end-half_wave);
    as1 = reshape(as1,EEG.pnts,EEG.trials);
    
    
    % convolution for chan2
    as2 = ifft(waveletX.*data2X,nConv);
    as2 = as2(half_wave+1:end-half_wave);
    as2 = reshape(as2,EEG.pnts,EEG.trials);
    
    
    % collect "eulerized" phase angle differences
    cdd = exp(1i*( angle(as1)-angle(as2) ));
    
    % compute ISPC and PLI (and average over trials!)
    ispc(fi,:) = abs(mean(cdd,2));
    pli(fi,:)  = abs(mean(sign(imag(cdd)),2));
end


% plot the two
figure(8), clf

subplot(221)
contourf(EEG.times,frex,ispc,40,'linecolor','none')
set(gca,'xlim',[-300 1200],'clim',[0 .4])
colormap hot; colorbar
xlabel('Time (ms)'), ylabel('Frequency (Hz)')
title('ISPC, voltage')

subplot(222)
contourf(EEG.times,frex,pli,40,'linecolor','none')
set(gca,'xlim',[-300 1200],'clim',[0 .4])
colormap hot; colorbar
title('PLI, voltage')



%%% QUESTION: Are you surprised at the difference between ISPC and PLI? 
%             How you do interpret this difference?
% 


%% Now compare the previous results to results from the Laplacian

% copy/paste the code from the previous cell, except:
%   (1) use the laplacian instead of voltage data
%   (2) put the new results in the plots below the voltage plots




%% 
% 
%  VIDEO: Phase synchronization over time vs over trials
% 
% 


% Import the v1 dataset. Use complex wavelet convolution to extract phase
%  values from channels 1 and 7 at 44 Hz. Store the phase values for all time
%  points and all trials.

clear
load v1_laminar.mat
npnts = size(csd,2);
ntrials = size(csd,3);


% channels for connectivity
chan1idx = 1;
chan2idx = 7;


% create complex Morlet wavelet
cent_freq = 44;
time      = -2:1/srate:2-1/srate;
s         = 10/(2*pi*cent_freq);
wavelet   = exp(2*1i*pi*cent_freq.*time) .* exp(-time.^2./(2*s^2));
half_wavN = (length(time)-1)/2;

% FFT parameters
nWave = length(time);
nData = npnts*ntrials;
nConv = nWave + nData - 1;

% FFT of wavelet (check nfft)
waveletX = fft(wavelet,nConv);
waveletX = waveletX ./ max(waveletX);


% initialize output time-frequency data
phase_data = zeros(2,npnts,ntrials);


% analytic signal of channel 1
dataX = fft(reshape(csd(chan1idx,:,:),1,[]),nConv);
as = ifft(waveletX.*dataX,nConv);
as = as(half_wavN+1:end-half_wavN);
as = reshape(as,npnts,ntrials);

% collect phase data
phase_data(1,:,:) = angle(as);


% analytic signal of channel 2


% collect phase data
phase_data(2,:,:) = angle(as);


% matrix of phase angle differences
phase_diffs = squeeze( phase_data(1,:,:)-phase_data(2,:,:) );

% eulerized for convenience
phase_diffs = 

%% plotting

figure(9), clf

% ISPC over trials
subplot(211)
ispc_trials = abs(mean(phase_diffs
plot(timevec,ispc_trials)
set(gca,'xlim',[-.2 1.2])
xlabel('Time (ms)'), ylabel('ISPC')

% ISPC over time
subplot(212)
ispc_time = abs(mean(phase_diffs
plot(1:ntrials,ispc_time)
xlabel('Trials'), ylabel('ISPC')



%% 
% 
%  VIDEO: Simulating data to test connectivity methods
% 
% 


% general parameters
clear
srate = 1000;
time = (0:5*srate-1)/srate;

% signal parameters
frex = 7.3;
phaselag = .05 * (2*pi);
noiselevel = 1;


% generate signals from the same sine wave plus independent noise
sig1 = sin( 2*pi*frex*time           ) + randn(size(time)) noiselevel;
sig2 = sin( 2*pi*frex*time + phaselag) + randn(size(time)) noiselevel;


% plot them
figure(10), clf
subplot(311)
plot()
xlabel('Time (s)')
legend({'Sig1';'Sig2'})
zoom on

%% Compute ISPC and PLI


% frequency parameters
min_freq = 20;
max_freq = 300;
num_frex = 4;

% set range for variable number of wavelet cycles
fwhm = .4;

% other wavelet parameters
frex  = linspace(min_freq,max_freq,num_frex);
wtime  = -2:1/srate:2;
half_wave = (length(wtime)-1)/2;

% FFT parameters
nWave = length(wtime);
nData = length(time);
nConv = nWave+nData-1;


% FFT of data (doesn't change on frequency iteration)
sig1X = fft( sig1 ,nConv);
sig2X = fft( sig2 ,nConv);

% initialize output time-frequency data
ispc = zeros(num_frex,1);
pli  = zeros(num_frex,1);

% loop over frequencies
for fi=1:num_frex
    
    % create wavelet and get its FFT
    wavelet  = exp(2*1i*pi*frex(fi).*wtime) .* exp( -4*log(2)*wtime.^2 / fwhm^2 );
    waveletX = fft();
    % normalize wavelet here??
    
    
    % convolution for chan1
    as1 = ifft(waveletX.*sig1X,nConv);
    as1 = as1(half_wave+1:end-half_wave);
    
    % convolution for chan2
    as2 = ifft(waveletX.*sig2X,nConv);
    as2 = as2(half_wave+1:end-half_wave);
    
    
    % collect "eulerized" phase angle differences
    cdd = 
    
    % compute ISPC and PLI (and average over trials!)
    ispc(fi) = 
    pli(fi)  = 
end


subplot(3,1,2:3)
plot(frex,ispc, frex,pli,'linew',3)
set(gca,'ylim',[0 1])
xlabel('Frequency (Hz)'), ylabel('Synchronization strength')
legend({'ISPC';'PLI'})


%%% QUESTION: What is the effect of the phaselag parameter of the results?
% 
% 
%%% QUESTION: Set the noise level high (e.g., 10). Run through the
%             simulation multiple times. Do you notice any differences
%             between PLI and ISPC?
% 
% 




%% 
% 
%  VIDEO: Granger causality (or prediction, whatever)
% 
% 


% univariate autoregressive model parameters
a1 = 1.2;
a2 = -.9;
N = 30;

% start with two random points
x = randn(2,1);

% add new points according to previous weighted values
for t=2:N-1
    x(t+1) = a1*x(t) + a2*x(t-1);
end


% and plot
figure(11), clf
plot(happiness,'s-','markerfacecolor','k','markersize',10,'linew',2)


%% bivariate autoregression

% regression parameters
a1 = 1.2;
a2 = -.9;
N = 30;

% initialize data vectors
x = randn(N,1);
y = randn(2,1);

% new y
for t=2:N-1
    y(t+1) = a1*x(t) + a2*x(t-1);
end

figure(12), clf, hold on
plot(1:N,x  ,'s-','markerfacecolor','k','markersize',10,'linew',2)
plot(1:N,y-3,'s-','markerfacecolor','k','markersize',10,'linew',2)
legend({'x';'y'},'box','off')
set(gca,'ytick',[])

%% a longer example of bivariate autoregression

% frequencies for the sine waves
freq1 = 10;
freq2 = 2;

% simulation parameters
srate = 1000;
time  = 0:1/srate:1;

% define x
x = .39*sin(2*pi*freq1.*time) + .7*sin(2*pi*freq2.*time) + randn(size(time))/5;

% define y by x
y = [0 .2];
for i=3:length(x)
    y(i) = .8*x(i-2) + 1.2*x(i-1) + randn/5;
end

figure(13), clf
plot(time,x,'m',time,y,'k')

xlabel('Time (ms)')
ylabel('Amplitude (arb. units)')
title('Bivariate autoregression')

legend({[ 'x = .39*sin(2\pi' num2str(freq1) 't) + .7*sin(2\pi' num2str(freq2) 't) + \sigma' ],'y = .8x_{t-2} + 1.2x_{t-1} + \sigma'})


%% Autoregression model estimation




% construct autoregression model
x=1;
for i=1:30
    x(i+1) = 1.1*x(i);
end

% recover parameters using armorf function (note: this function is taken
% from the BSMART toolbox (available online).
[Ax,Ex] = armorf(x,1,length(x),1);
fprintf('\n\n')
disp('Univariate AR, timeseries 1:')
disp([ '  Autoregression coefficient (order=1): ' num2str(Ax) ', Error: ' num2str(Ex) ]);

% try using order=2;
[Ax,Ex] = armorf(x,1,length(x)
disp([ '  Autoregression coefficients (order=2): ' num2str(Ax) ', Error: ' num2str(Ex) ]);
disp(' ')





%%% another example with true order=2
x=[1 1.5];
for i=1:30
    x(i+2) = 1.1*x(i) + -.3*x(i+1);
end

% recover parameters using armorf function
[Ax,Ex] = armorf(x,1,length(x),1);
disp('Univariate AR, timeseries 2:')
disp([ '  Autoregression coefficient (order=1): ' num2str(Ax) ', Error: ' num2str(Ex) ]);

% try using order=2;
[Ax,Ex] = armorf(x,1,length(x),2);
disp([ '  Autoregression coefficients (order=2): ' num2str(Ax) ', Error: ' num2str(Ex) ]);
fprintf('\n')






%%% another example with bivariate
x = .39*sin(2*pi*freq1.*time) + .7*sin(2*pi*freq2.*time) + randn(size(time))/10;
y = [0 0];
for i=1:length(x)-2
    y(i+2) = -.8*x(i) + 1.2*x(i+1);
end

% 
[Axy,Exy] = armorf([x; y],1,length(x),2);
disp('Bivariate AR:')
Axy
Exy

%%%%% NOTE: In the video I explained the organization of Axy incorrectly.
%%%%% The correct organization is as follows:
% Note: variable Axy is organized as:
%    XX_1 XX_1  YX_2 YX_2
%    XY_1 XY_1  YY_2 YY_2


%% Directed synchrony through Granger prediction


% load our favorite EEG data
load sampleEEGdata.mat

% define channels to compute granger synchrony between
chan1name = 'fcz';
chan2name = 'o1';

% find the index of those channels
chan1 = find( strcmpi(chan1name,{EEG.chanlocs.labels}) );
chan2 = find( strcmpi(chan2name,{EEG.chanlocs.labels}) );

% define autoregression parameters (can leave as default for now)
order = 14;


% get AR coefficients and error from each signal
[Ax,Ex] = armorf(EEG.data(chan1,:,1),1,EEG.pnts,order);
[Ay,Ey] = armorf(EEG.data(chan2,:,1),1,EEG.pnts,order);


%%% we are going to reconstruct the data using the autoregressive coefficients
x = zeros(1,EEG.pnts);
y = zeros(1,EEG.pnts);

x(1:order) = EEG.data(chan1,1:order,1);
y(1:order) = EEG.data(chan2,1:order,1);

for i=order+1:EEG.pnts
    
    % initialize
    thispointX = 0;
    thispointY = 0;
    
    for ai=1:order
        thispointX = thispointX + EEG.data(chan1,i-ai,1)*Ax(ai);
        thispointY = thispointY + EEG.data(chan2,i-ai,1)*Ay(ai);
    end
    x(i-1) = thispointX;
    y(i-1) = thispointY;
end

figure(14), clf
subplot(211)
plot(EEG.times,EEG.data(chan1,:,1),'b', EEG.times,x,'r')
legend({'Real data';'Reconstructed from ARmodel'})

subplot(212)
plot(EEG.times,EEG.data(chan2,:,1),'b', EEG.times,y,'r')
legend({'Real data';'Reconstructed from ARmodel'})

%% Now for Granger prediction


% Bivariate autoregression and associated error term
[Axy,E] = armorf(EEG.data([chan1 chan2],:,1),1,EEG.pnts,order);


% time-domain causal estimate
granger_chan2_to_chan1 = log(Ex/E(1,1));
granger_chan1_to_chan2 = log(Ey/E(2,2));

disp([ 'Granger prediction from ' chan1name ' to ' chan2name ' is ' num2str(granger_chan1_to_chan2) ]);
disp([ 'Granger prediction from ' chan2name ' to ' chan1name ' is ' num2str(granger_chan2_to_chan1) ]);

%% Now we compute granger prediction over time

% initialize
x2yT = zeros(1,EEG.pnts);
y2xT = zeros(1,EEG.pnts);

% GC parameters
iwin   = 300; % in ms
iorder = 15;  % in ms


% convert window/order to points
win   = round(iwin/(1000/EEG.srate));
order = round(iorder/(1000/EEG.srate));

for timei=1:EEG.pnts-win
    
    % data from all trials in this time window
    % Data should be normalized before computing Granger estimates
    tempdata = zscore(reshape(EEG.data([chan1 chan2],timei:timei+win-1,1),2,win),0,2);
    
    %% fit AR models (model estimation from bsmart toolbox)
    [Ax,Ex] = armorf(tempdata(1,:),1,win,order);
    [Ay,Ey] = armorf(tempdata(2,:),1,win,order);
    [Axy,E] = armorf(tempdata     ,1,win,order);
    
    % time-domain causal estimate
    y2xT(timei) = log(Ex/E(1,1));
    x2yT(timei) = log(Ey/E(2,2));
    
end

% draw lines
figure(15), clf, hold on

plot(EEG.times,x2yT)
plot(EEG.times,y2xT,'r')
legend({[ 'GC: ' chan1name ' -> ' chan2name ];[ 'GC: ' chan2name ' -> ' chan1name ]})

title([ 'Window length: ' num2str(iwin) ' ms, order: ' num2str(iorder) ' ms' ])
xlabel('Time (ms)')
ylabel('Granger prediction estimate')
set(gca,'xlim',[-200 1000])



%% 
% 
%  VIDEO: Connectivity hubs
% 
% 


clear
load sampleEEGdata.mat
EEG.data = double(EEG.data);

% frequency in hz
frex = 10;

% time window for synchronization
tidx = [ 0 500 ]


% time vector for wavelet
wtime = -1:1/EEG.srate:1;
fwhm = .2;


% convolution parameters
nData = EEG.pnts*EEG.trials;
nWave = length(wtime);
nConv = nData + nWave - 1;
halfW = floor(nWave/2);


% create wavelet
cmwX = fft( exp(1i*2*pi*frex*wtime) .* exp( -4*log(2)*wtime.^2 / fwhm^2 ) ,nConv );

% Fourier spectrum of the data
dataX = fft( reshape(EEG.data,EEG.nbchan,[]) ,nConv,2 );


% convolution. Do all channels in one line of code!
as = ifft( 
as = as(halfW:end-halfW-1); % trim wings, check sizes!
as = reshape( as,size(EEG.data) );

% get angles
allphases = angle(as);

%% compute all-to-all PLI

pliall = zeros(EEG.nbchan);

for chani=1:EEG.nbchan
    for chanj=chani+1:EEG.nbchan
        
        % Euler-format phase differences
        cdd = exp( 1i*(allphases(chani,tidx(1):tidx(2),:)-allphases(chanj,tidx(1):tidx(2),:)) );
        cdd = squeeze(cdd);
        
        % compute PLI for this channel pair
        plitmp = mean( abs(mean(sign(imag(cdd
        
        % enter into matrix!
        pliall(chani,chanj) = plitmp;
    end
end
        
% let's see what it looks like
figure(10), clf
imagesc(pliall)
axis square
xlabel('Channels'), ylabel('Channels')
title([ 'All-to-all connectivity at ' num2str(frex) ' Hz' ])
set(gca,'clim',[.2 .6])

%% now for hubness

% define a threshold
% gather unique data values into a vector (convenience)
distdata = nonzeros(triu(pliall));

% define a threshold
thresh = 

% binarize the matrix by testing against the threshold
pliallThresh = 


% plots!
figure(11), clf
subplot(311), hold on
histogram(distdata,50)
plot([1 1]*thresh,get(gca,'ylim'),'r--','linew',3)
xlabel('PLI (synch. strength)'), ylabel('Count')
legend({'Distribution';'Threshold'})


subplot(3,2,[3 5])
imagesc(pliallThresh)
axis square
xlabel('Channels'), ylabel('Channels')
title([ 'All-to-all connectivity at ' num2str(frex) ' Hz' ])


subplot(3,2,[4 6])
topoplotIndie(sum(pliallThresh)/EEG.nbchan,EEG.chanlocs,'numcontour',0);
set(gca,'clim',[.1 .4])
title('Topoplot of "hubness"')
colormap hot
colorbar

%%% QUESTION: Does the threshold affect the qualitative topographical distribution?
% 
% 
%%% QUESTION: Do the results look different for different frequencies or time windows?
% 
% 


%% done.
