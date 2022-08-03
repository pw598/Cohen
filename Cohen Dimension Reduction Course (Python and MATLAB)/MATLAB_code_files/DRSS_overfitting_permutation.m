%%
%     COURSE: PCA & multivariate signal processing, applied to neural data
%    SECTION: Overfitting and inferential statistics
%      VIDEO: Permutation testing
% Instructor: sincxpress.com
%
%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc

%%


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


figure(1), clf
clim = [-45 45];
subplot(221)
topoplotIndie(lf.Gain(:,2,dipoleLoc1), EEG.chanlocs,'maplimits',clim,'numcontour',0,'electrodes','off','shading','interp');
title('Simulation dipole projection')

colormap jet

%% insert activity waveforms into dipole data

% frequency of the dipole
freq1 = 10;

% time point of "stimulus" onset
tidx = dsearchn(EEG.times',mean(EEG.times));

% the "innards" of the sine function
omega1 = 2*pi*freq1*EEG.times(tidx:end);


% loop over trials
for ti=1:EEG.trials
    
    % source waveforms (sine waves with random phase)
    swave1 = sin( omega1 + rand*2*pi );
    
    dipole_data = randn(size(lf.Gain,3),EEG.pnts)/5;
    dipole_data(dipoleLoc1,tidx:end) = dipole_data(dipoleLoc1,tidx:end) + swave1;
    
    % project to scalp
    EEG.data(:,:,ti) = squeeze(lf.Gain(:,2,:))*dipole_data;
end

%% GED for spatial filter

[covPre,covPst] = deal( zeros(EEG.nbchan) );


% covariance matrices per trial
for ti=1:EEG.trials
    
    % "prestim" covariance
    tdat = squeeze(EEG.data(:,1:tidx,ti));
    tdat = tdat - mean(tdat,2);
    covPre = covPre + (tdat*tdat')/(EEG.pnts/2);
    
    % "post-stim" covariance
    tdat = squeeze(EEG.data(:,tidx:end,ti));
    tdat = tdat - mean(tdat,2);
    covPst = covPst + (tdat*tdat')/(EEG.pnts/2);
end

covPre = covPre./ti;
covPst = covPst./ti;

% GED
[evecs,evals] = eig(covPst,covPre);
[evals,sidx]  = sort( diag(evals),'descend' );
evecs = evecs(:,sidx);


%%% compute filter forward models and flip sign
maps = evecs(:,1)'*covPst;   % get component
[~,idx] = max(abs(maps));    % find max magnitude
maps = maps*sign(maps(idx)); % possible sign flip


%%% compute component time series (projections)
cdat = reshape( evecs(:,1)'*reshape(EEG.data,EEG.nbchan,[]), [ EEG.pnts EEG.trials ]);


%% permutation testing

nPermutes = 500;

% initialize matrix of eigenvalues under the null hypothesis
pevals = zeros(nPermutes,EEG.nbchan);

% loop over permutations
for permi=1:nPermutes
    
    % time vector with random start time
    cutidx = ceil( rand*EEG.pnts );
    tidx   = mod(cutidx:cutidx+EEG.pnts-1,EEG.pnts)+1;
    halft  = ceil(EEG.pnts/2);
    % use tidx(1:halft) and tidx(halft+1:end)
    
    
    % reinitialize covariance matrices
    [covPre,covPst] = deal( zeros(EEG.nbchan) );
    
    % covariance matrices per trial
    for ti=1:EEG.trials
        
        % "prestim" covariance
        tdat = squeeze(EEG.data(:,tidx(1:halft),ti));
        tdat = tdat - mean(tdat,2);
        covPre = covPre + (tdat*tdat');
        
        % "post-stim" covariance
        tdat = squeeze(EEG.data(:,tidx(halft+1:end),ti));
        tdat = tdat - mean(tdat,2);
        covPst = covPst + (tdat*tdat');
    end
    
    % GED
    pevals(permi,:) = sort( eig(covPst,covPre),'descend' );
    
end


% inferential statistics for first component
zval = (evals(1)-mean(pevals(:,1))) / std(pevals(:,1));
pval = normcdf(-abs(zval));

%% show topographical maps and eigenspectrum

% map
subplot(222)
topoplotIndie(maps,EEG.chanlocs,'numcontour',0,'electrodes','off');
title('Component map')



% eigenspectra
subplot(212)
plot(evals,'s-','linew',2,'markersize',10,'markerfacecolor','k')
hold on

% add mean and spread of null distributions
errorbar(mean(pevals),2*std(pevals),'ro-')
legend({'Observed';'H_0 (mean\pm2std)'})

set(gca,'xlim',[0 15])
xlabel('Component'), ylabel('\lambda')
title([ 'Eigspectrum (comp1 z=' num2str(zval) ', p=' num2str(round(1000*pval)/1000) ')' ])

%% corrected significance threshold

eigvalCrit = prctile(pevals(:,1),95);
plot([.5 15],[1 1]*eigvalCrit,'k--','linew',2)

%% done.
