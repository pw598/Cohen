%%
%     COURSE: PCA and multivariate neural signal processing
%    SECTION: Source separation with GED
%      VIDEO: GED vs. factor analysis
% Instructor: sincxpress.com
%
%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc

%% preliminaries

% mat file containing EEG, leadfield and channel locations
load emptyEEG

EEG.srate  = 500;
EEG.trials = 200;  % total, 1/2 per condition
EEG.pnts   = 1000; % time points per trial
EEG.times  = (0:EEG.pnts-1)/EEG.srate;
EEG.data   = zeros(EEG.nbchan,EEG.pnts,EEG.trials);

%% dipole locations

dipoleLoc1 = 109;
dipoleLoc2 = 135;


figure(1), clf
clim = [-45 45];
subplot(331)
topoplotIndie(-lf.Gain(:,1,dipoleLoc1), EEG.chanlocs,'maplimits',clim,'numcontour',0,'electrodes','numbers','shading','interp');
title('Simulation dipole 1')

subplot(332)
topoplotIndie(-lf.Gain(:,1,dipoleLoc2), EEG.chanlocs,'maplimits',clim,'numcontour',0,'electrodes','numbers','shading','interp');
title('Simulation dipole 2')

%% insert activity waveforms into dipole data

% frequencies of the two dipoles
freq1 = 12;
freq2 = 12;

% time point of "stimulus" onset
tidx = dsearchn( EEG.times',mean(EEG.times) );

% the "innards" of the sine function
omega1 = 2*pi*freq1*EEG.times(tidx:end);
omega2 = 2*pi*freq2*EEG.times(tidx:end);


% loop over trials
for ti=1:EEG.trials
    
    % source waveforms (sine waves with random phase)
    swave1 = 2*sin( omega1 + rand*2*pi );
    swave2 = 2*sin( omega2 + rand*2*pi );
    
    dipole_data = randn(size(lf.Gain,3),EEG.pnts)/4;
    dipole_data(dipoleLoc1,tidx:end) = dipole_data(dipoleLoc1,tidx:end) + swave1;
    dipole_data(dipoleLoc2,tidx:end) = dipole_data(dipoleLoc2,tidx:end) + swave2;
    
    
    % project to scalp
    EEG.data(:,:,ti) = squeeze(lf.Gain(:,1,:))*dipole_data;
end

%% GED for spatial filter

[covPre,covPst] = deal( zeros(EEG.nbchan) );


% covariance matrices per trial
for ti=1:EEG.trials
    
    % "prestim" covariance
    tdat = squeeze(EEG.data(:,1:tidx,ti));
    tdat = bsxfun(@minus,tdat,mean(tdat,2));
    covPre = covPre + (tdat*tdat')/EEG.pnts;
    
    % "post-stim" covariance
    tdat = squeeze(EEG.data(:,tidx:end,ti));
    tdat = bsxfun(@minus,tdat,mean(tdat,2));
    covPst = covPst + (tdat*tdat')/EEG.pnts;
end

covPre = covPre./ti;
covPst = covPst./ti;

% GED
[evecs,evals] = eig(covPst,covPre);
[evals,sidx] = sort( diag(evals),'descend' );
evecs = evecs(:,sidx);
maps  = covPst * evecs;

% fix sign
[~,idx] = max(abs(maps(:,1)));
maps(:,1) = maps(:,1)*sign(maps(idx,1));
[~,idx] = max(abs(maps(:,2)));
maps(:,2) = maps(:,2)*sign(maps(idx,2));

% compute component time series (projections) in 2D for TF analysis
comp2d = evecs(:,1:2)'*reshape(EEG.data,EEG.nbchan,[]);


% topoplots of component maps
subplot(334), topoplotIndie(maps(:,1),EEG.chanlocs);
title('GED component 1')

subplot(335), topoplotIndie(maps(:,2),EEG.chanlocs);
title('GED component 2')

subplot(336), plot(evals,'s-','linew',2,'markersize',10,'markerfacecolor','k')
set(gca,'xlim',[0 15])
ylabel('\lambda'), title('Eigenspectrum'), axis square

%% factor analysis

% factoran using no special inputs and assuming 2 factors
[Lambda, Psi, rotMat, stats, F] = factoran(reshape(EEG.data,EEG.nbchan,[])',2);

% show topoplots of factor projections
subplot(337), topoplotIndie(Lambda(:,1),EEG.chanlocs);
title('FA factor 1')

subplot(338), topoplotIndie(Lambda(:,2),EEG.chanlocs);
title('FA factor 2')

%% quick TF analysis...

% frequencies to extract
frex = linspace(2,20,20);


% initialize TF matrices
ctf = zeros(2,length(frex),EEG.pnts); % component TF
ftf = zeros(2,length(frex),EEG.pnts); % factor TF

for fi=1:length(frex)
    
    for compi=1:2
        
        % on GED component
        as = reshape(abs(hilbert(filterFGx(comp2d(compi,:),EEG.srate,frex(fi),4))).^2 ,EEG.pnts,EEG.trials);
        ctf(compi,fi,:) = mean(as,2);
        
        
        % on factor loadings
        as = reshape(abs(hilbert(filterFGx(F(:,compi)',EEG.srate,frex(fi),4))).^2 ,EEG.pnts,EEG.trials);
        ftf(compi,fi,:) = mean(as,2);
        
    end
end

%% Show the time-frequency power maps

figure(2), clf

for compi=1:2
    
    % GED component
    subplot(2,2,compi)
    contourf(EEG.times,frex,squeeze(ctf(compi,:,:)),40,'linecolor','none')
    axis square
    title([ 'Component ' num2str(compi) ])
    xlabel('Time (s)'), ylabel('Frequency (Hz)')
    
    % FA component
    subplot(2,2,compi+2)
    contourf(EEG.times,frex,squeeze(ftf(compi,:,:)),40,'linecolor','none')
    axis square
    title([ 'Factor ' num2str(compi) ])
end


%% end
