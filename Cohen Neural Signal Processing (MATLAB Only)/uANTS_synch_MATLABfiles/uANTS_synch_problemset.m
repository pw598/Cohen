%%
%   COURSE: Neural signal processing and analysis: Zero to hero
%  SECTION: Synchronization problem set
%  TEACHER: Mike X Cohen, sincxpress.com
%


%% 1) All-to-all connectivity matrix
%  In this exercise, you are going to compute connectivity between
%    all pairs of channels. It will create a channel X channel matrix.

% First, import the v1 data and setup parameters for wavelet convolution 
%   at 8 hz and 55 hz.

clear

% load in data
load v1_laminar

% useful variables for later...
[nchans, npnts, ntrials] = size(1);


% specify frequencies
frex = [8 55];
nCycles = [ 7 14 ];

% parameters for complex Morlet wavelets
wavtime  = -1:1/srate:1-1/srate; % why remove a sample point?!
half_wav = (length(wavtime)-1)/2;

% FFT parameters
nWave = length(wavtime);
nData = npnts*ntrials;
nConv = nWave+nData-1;

% and create wavelets
cmwX = zeros(length(frex),nConv);
for fi=1:length(frex)
    s       = 
    cmw      = exp(1i*2*pi*frex(fi).*wavtime) .* exp( (-wavtime.^2) ./ (2*s^2) );
    tempX     = fft(cmw,nConv);
    cmwX(fi,:) = tempX ./ max(tempX);
end

%% run convolution to extract phase values (don't need power)
% store the phase angle time series in a 
%    channels X frequency X time X trials matrix

allphases = 

% spectrum of all channels using the fft matrix input 
% (check the matrix sizes and FFT inputs!)
dataX = fft( reshape(csd,nchans,npnts*ntrials) );

for fi=1:length(frex)
    
    % run convolution
    as = ifft( bsxfun(@times,dataX,cmwX(fi,:)) ,nConv,2 );
    as = as(:,half_wav+1:end-half_wav);
    
    
    % phase values from all trials
    allphases(:,fi,:,:) = angle( as );
end


%% now compute connectivity
% Compute connectivity separately in two time windows:
%   .1 to .4, and .6 to .9 seconds.
% To do this, first compute synchronization over trials, then average the
%    synchronization values within those time windows.

% define time windows
tidx1 = dsearchn(timevec',[.1 .4]');
tidx2 = dsearchn(timevec',[.6 .9]');


% initialize a channels X channels X frequency X time period matrix
connmat = zeros(nchans,nchans,length(frex),2);

% in a double for-loop, compute phase synchronization between each pair
% inside the for-loop 
for chani=1:nchans
    for chanj=1:nchans
        
        % compute eulerized phase angle differences
        phasediffs = 
        
        % compute phase synchronization (ISPC) for all time points
        ispc = 
        
        % get data averaged from the two time windows
        connmat(chani,chanj,:,1) = 
        connmat(chani,chanj,:,2) = 
    end
end

%% Make all-to-all connectivity plots
% In one figure, make six chan-by-chan matrices for 8 and 55 hz (upper and lower plots)
%   from averaged connectivity between .1-.4 s (left) and .6-.9 s (middle). 
% The right-most plot should show the difference of late-early connectivity.
% Use the same colorscaling for all 'raw' plots, 
%   and a different colorscaling for the difference plots.

% define color limits
clim  = [0 .8];
climD = [-.4 .4];


figure(1), clf
subplot(231)
imagesc(squeeze(connmat(:,:,1,1)))
axis square
set(gca,'clim',clim,'xtick',1:nchans,'ytick',1:nchans)
title([ num2str(round(timevec(tidx1(1)),1)) '-' num2str(round(timevec(tidx1(2)),1)) 's, ' num2str(frex(1)) ' Hz' ])


subplot(232)
imagesc(squeeze(connmat(:,:,1,2)))
axis square
set(gca,'clim',clim,'xtick',1:nchans,'ytick',1:nchans)
title([ num2str(round(timevec(tidx2(1)),1)) '-' num2str(round(timevec(tidx2(2)),1)) 's, ' num2str(frex(1)) ' Hz' ])


subplot(233)
imagesc(squeeze(connmat(:,:,1,2)-connmat(:,:,1,1)))
axis square
set(gca,'clim',climD,'xtick',1:nchans,'ytick',1:nchans)
title([ 'post-pre, ' num2str(frex(1)) ' Hz' ])






subplot(234)
imagesc(squeeze(connmat(:,:,2,1)))
axis square
set(gca,'clim',clim,'xtick',1:nchans,'ytick',1:nchans)
title([ num2str(round(timevec(tidx1(1)),1)) '-' num2str(round(timevec(tidx1(2)),1)) 's, ' num2str(frex(2)) ' Hz' ])


subplot(235)
imagesc(squeeze(connmat(:,:,2,2)))
axis square
set(gca,'clim',clim,'xtick',1:nchans,'ytick',1:nchans)
title([ num2str(round(timevec(tidx2(1)),1)) '-' num2str(round(timevec(tidx2(2)),1)) 's, ' num2str(frex(2)) ' Hz' ])

subplot(236)
imagesc(squeeze(connmat(:,:,2,2)-connmat(:,:,2,1)))
axis square
set(gca,'clim',climD,'xtick',1:nchans,'ytick',1:nchans)
title([ 'post-pre, ' num2str(frex(2)) ' Hz' ])

%%% QUESTIONS:
%   How do you interpret any of these things?!?!



%% 2) Seeded synchronization with topographical maps.
%     The goal of this assignment is to explore "seeded" synchronization,
%     which means synchronization from one electrode to all other
%     electrodes.

% load in the sample EEG dataset
clear


%% Perform wavelet convolution on all channels/trials. Save the single-trial phase data for all channels.
%  Don't worry about the power data.


% soft-coded parameters for time-frequency analysis
freqrange  = [2 40];
numfrex    = 5090000000000000000000000000000000000000;
numcycles  = linspace(3,9,numfrex);


% set up wavelet and convolution parameters
wavtime = :1/EEG.srate:
frex    = linspace(freqrange(1),freqrange(2),numfrex);
nData   = EEG.pnts*EEG.trials;
nKern   = length(wavtime);
nConv   = nData + nKern -1;
halfwav = (length(wavtime)-1)/2;


% create wavelets
waveletsX = zeros(numfrex,nConv);
for fi=1:numfrex
    
    % create time-domain wavelet
    s = numcycles(fi) / (2*pi*frex(fi));
    wavelet = 
    
    % compute fourier coefficients of wavelet. need to normalize?
    waveletsX(fi,:) = fft(wavelet,nConv);
end



% initialize matrix to store all phase values
allphases = zeros(EEG.nbchan,numfrex,EEG.pnts,EEG.trials);


% now do convolution!
% loop over channels
for chani=1:EEG.nbchan
    
    % compute Fourier coefficients of EEG data (doesn't change over frequency!)
    eegX = fft( reshape(EEG.data(chani,:,:),1,nConv) ,nConv);
    
    % loop over frequencies
    for fi=1:numfrex
        
        % second and third steps of convolution
        as = ifft( eegX.*waveletsX(fi,:) );
        % reshape to time X trials
        as = reshape(as(halfwav+1:end-halfwav),EEG.pnts,EEG.trials);
        
        % save phase values from all time points and trials
        allphases(chani,fi,:,:) = angle( as );
        
    end % end frequency loop
end % end channel loop

%% 

% Compute FCz-to-all and Oz-to-all connectivity in the window of 0-600 ms
% from 8-12 Hz. Show topoplots.
% Then compute connectivity from -600 to 0. Subtract to show task-related
% connectivity. Interpret in context of volume conduction.


% time indices
tidx1 = 
tidx2 = 

% frequency indices
fidx = 

% channel indices
FCzidx = strcmpi('fcz',{EEG.chanlocs.labels});
Ozidx  = strcmpi('oz',{EEG.chanlocs.labels});


% initialize seeded synchronization maps
[fcz_seeded_synch,oz_seeded_synch] = 


% loop over channels
for chani=1:EEG.nbchan
    
    % compute complex unit vectors defined by phase angle differences
    % from the 'seed' channel to the looping channel
    fcz_euler = 
    oz_euler  = 
    
    % compute ITPC seeded synchronization over all time-frequency points
    synch_fcz_all = 
    synch_oz_all  = 
    
    
    % extract average synchronization from the time-frequency windows
    fcz_seeded_synch(1,chani) = 
    oz_seeded_synch(1,chani)  = 
    
    fcz_seeded_synch(2,chani) = 
    oz_seeded_synch(2,chani)  = 
    
end

%% now plotting

% use the same color limit
clim = [0 1]; % for the 'raw' synchronization
climdiff = [-.1 .1]; % for the difference in synchronization



figure(3), clf

subplot(321)
topoplotIndie(fcz_seeded_synch(1,:),EEG.chanlocs,'numcontour',0);
set(gca,'clim',clim)
title('FCz seed, pre')

subplot(323)
topoplotIndie(fcz_seeded_synch(2,:),EEG.chanlocs,'numcontour',0);
set(gca,'clim',clim)
title('FCz seed, post')

subplot(325)
topoplotIndie(diff(fcz_seeded_synch),EEG.chanlocs,'numcontour',0);
set(gca,'clim',climdiff)
title('FCz seed, post-pre')



subplot(322)
topoplotIndie(oz_seeded_synch(1,:),EEG.chanlocs,'numcontour',0);
set(gca,'clim',clim)
title('Oz seed, pre')

subplot(324)
topoplotIndie(oz_seeded_synch(2,:),EEG.chanlocs,'numcontour',0);
set(gca,'clim',clim)
title('Oz seed, post')

subplot(326)
topoplotIndie(diff(oz_seeded_synch),EEG.chanlocs,'numcontour',0);
set(gca,'clim',climdiff)
title('Oz seed, post-pre')

%% 3) Adapt the code above to use PLI instead of ISPC.
%     Plot in a different figure so you can compare them. 
%     What do you think of the results?


%% 4) Adapt the code above again using the Laplacian instead of voltage.
%     Comment!


%% 5) Time-frequency maps of inter-regional synchronization.
%     Make two time-frequency maps of FCz-Oz ISPC; one plotting the 'raw' connectivity
%     and one plotting the baseline-subtracted connectivity (use a baseline of -500 to -200 ms).

% baseline time window index
baseidx = 



% extract the connectivity
phasediffs = 
synch_raw  = 
synch_base = 



% plotting 
figure(5), clf
subplot(211)
contourf(EEG.times,frex,synch_raw,40,'linecolor','none')
set(gca,'clim',[0 .3],'xlim',[-300 1200])
xlabel('Time (ms)'), ylabel('Frequencies (Hz)')
title('FCz-Oz ISPC, "raw" phase synch.')
colorbar

subplot(212)
contourf(EEG.times,frex,synch_base,40,'linecolor','none')
set(gca,'clim',[-.3 .3],'xlim',[-300 1200])
xlabel('Time (ms)'), ylabel('Frequencies (Hz)')
title('FCz-Oz ISPC, baseline-subtracted')
colorbar


%% done.
