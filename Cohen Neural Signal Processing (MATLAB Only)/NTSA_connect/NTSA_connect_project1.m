%%
%     COURSE: Solved challenges in neural time series analysis
%    SECTION: Connectivity
%      VIDEO: Project 5-1: ISPC and PLI, with and without Laplacian
% Instructor: sincxpress.com
%
%%

% load data and pick channels
load sampleEEGdata

% compute Laplacian
EEG.lap = 

%% select parameters

% pick two channels for synchronization
chan1 = 'FCz';
chan2 = 'POz';

% frequency range for convolution
min_freq =  2;
max_freq = 20;
num_frex = 30;

% set range for wavelet FWHM
% Note: encoded as number of cycles per frequency
fwhm_range = [ 2 4 ];

% frequencies vectors
frex  = linspace(min_freq,max_freq,num_frex);
fwhms = linspace(fwhm_range(1),fwhm_range(2),num_frex);

%% wavelet parameters 

% wavelet and convolution parameters
wtime = 
nWave = 
nData = 
nConv = 
halfw = 

%% FFT of data and Laplacian

EEG1X = fft( 
EEG2X = fft( 

LAP1X = fft( 
LAP2X = fft( 


%% convolution and etc

% initialize output time-frequency data
[ispc,pli] = deal( zeros(2,num_frex,EEG.pnts) );

% loop over frequencies
for fi=1:num_frex
    
    %% create wavelet
    
    % create wavelet and get its FFT
    cmw  = 
    cmwX = fft(cmw,nConv);
    % need to normalize??
    
    %% convolution for voltage data
    
    % chan1
    as1 = reshape(as1,EEG.pnts,EEG.trials);
    
    % chan2
    as2 = reshape(as2,EEG.pnts,EEG.trials);
    
    % collect "eulerized" phase angle differences
    phasediffVOLT = 
    
    %% convolution for Laplacian data
    
    % chan1
    as1 = reshape(as1,EEG.pnts,EEG.trials);
    
    % chan2
    as2 = reshape(as2,EEG.pnts,EEG.trials);
    
    % collect "eulerized" phase angle differences
    phasediffLAP = 
    
    %% connectivities
    
    % ISPC and PLI for voltage
    ispc(1,fi,:) = 
    pli(1,fi,:)  = 
    
    % ISPC and PLI for laplacian
    ispc(2,fi,:) = 
    pli(2,fi,:)  = 
    
end


%% plotting

figure(1), clf
colormap hot

clim = [.1 .4];
datalabels = {'Voltage';'Laplacian'};

for i=1:2
    
    % ISPC
    subplot(2,2,i)
    contourf
    set(gca,'xlim',[-300 1000],'clim',clim)
    xlabel('Time (ms)'), ylabel('Frequency (Hz)')
    title([ 'ISPC: ' datalabels{i} ])
    
    
    % PLI
    subplot(2,2,i+2)
    contourf
    set(gca,'xlim',[-300 1000],'clim',clim)
    xlabel('Time (ms)'), ylabel('Frequency (Hz)')
    title([ 'PLI: ' datalabels{i} ])
end

%% end.
