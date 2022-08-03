%%
%     COURSE: Solved challenges in neural time series analysis
%    SECTION: Connectivity
%      VIDEO: Project 5-1: Solutions
% Instructor: sincxpress.com
%
%%

% load data and pick channels
load sampleEEGdata

% compute Laplacian
EEG.lap = laplacian_perrinX(EEG.data,[EEG.chanlocs.X],[EEG.chanlocs.Y],[EEG.chanlocs.Z]);

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
fwhm_range = [ 2/min_freq 4/max_freq ];

% frequencies vectors
frex  = linspace(min_freq,max_freq,num_frex);
fwhms = linspace(fwhm_range(1),fwhm_range(2),num_frex);

%% wavelet parameters 

% wavelet and convolution parameters
wtime = -2:1/EEG.srate:2;
nWave = length(wtime);
nData = EEG.pnts*EEG.trials;
nConv = nWave+nData-1;
halfw = (length(wtime)-1)/2;

%% FFT of data and Laplacian

EEG1X = fft( reshape(EEG.data(strcmpi(chan1,{EEG.chanlocs.labels}),:,:),1,nData) ,nConv);
EEG2X = fft( reshape(EEG.data(strcmpi(chan2,{EEG.chanlocs.labels}),:,:),1,nData) ,nConv);

LAP1X = fft( reshape(EEG.lap (strcmpi(chan1,{EEG.chanlocs.labels}),:,:),1,nData) ,nConv);
LAP2X = fft( reshape(EEG.lap (strcmpi(chan2,{EEG.chanlocs.labels}),:,:),1,nData) ,nConv);


%% convolution and etc

% initialize output time-frequency data
[ispc,pli] = deal( zeros(2,num_frex,EEG.pnts) );

% loop over frequencies
for fi=1:num_frex
    
    %% create wavelet
    
    % create wavelet and get its FFT
    cmw  = exp(2*1i*pi*frex(fi).*wtime) .* exp(-4*log(2)*wtime.^2./fwhms(fi)^2);
    cmwX = fft(cmw,nConv);
    
    %% convolution for voltage data
    
    % chan1
    as1 = ifft(cmwX.*EEG1X,nConv);
    as1 = as1(halfw+1:end-halfw);
    as1 = reshape(as1,EEG.pnts,EEG.trials);
    
    % chan2
    as2 = ifft(cmwX.*EEG2X,nConv);
    as2 = as2(halfw+1:end-halfw);
    as2 = reshape(as2,EEG.pnts,EEG.trials);
    
    % collect "eulerized" phase angle differences
    phasediffVOLT = exp(1i*( angle(as1)-angle(as2) ));
    
    %% convolution for Laplacian data
    
    % chan1
    as1 = ifft(cmwX.*LAP1X,nConv);
    as1 = as1(halfw+1:end-halfw);
    as1 = reshape(as1,EEG.pnts,EEG.trials);
    
    % chan2
    as2 = ifft(cmwX.*LAP2X,nConv);
    as2 = as2(halfw+1:end-halfw);
    as2 = reshape(as2,EEG.pnts,EEG.trials);
    
    % collect "eulerized" phase angle differences
    phasediffLAP = exp(1i*( angle(as1)-angle(as2) ));
    
    %% connectivities
    
    % ISPC and PLI for voltage
    ispc(1,fi,:) = abs(mean(phasediffVOLT,2));
    pli(1,fi,:)  = abs(mean(sign(imag(phasediffVOLT)),2));
    
    % ISPC and PLI for laplacian
    ispc(2,fi,:) = abs(mean(phasediffLAP,2));
    pli(2,fi,:)  = abs(mean(sign(imag(phasediffLAP)),2));
    
end


%% plotting

figure(1), clf
colormap hot

clim = [.1 .4];
datalabels = {'Voltage';'Laplacian'};

for i=1:2
    
    % ISPC
    subplot(2,2,i)
    contourf(EEG.times,frex,squeeze(ispc(i,:,:)),40,'linecolor','none')
    set(gca,'xlim',[-300 1000],'clim',clim)
    xlabel('Time (ms)'), ylabel('Frequency (Hz)')
    title([ 'ISPC: ' datalabels{i} ])
    
    
    % PLI
    subplot(2,2,i+2)
    contourf(EEG.times,frex,squeeze(pli(i,:,:)),40,'linecolor','none')
    set(gca,'xlim',[-300 1000],'clim',clim)
    xlabel('Time (ms)'), ylabel('Frequency (Hz)')
    title([ 'PLI: ' datalabels{i} ])
end

%% end.
