%%
%     COURSE: PCA and multivariate neural signal processing
%    SECTION: Source separation with GED
%      VIDEO: Cross-validation for regularization
% Instructor: sincxpress.com
%
%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc

%% load data

load sampleEEGdata.mat
EEG.data = double(EEG.data);

%% get covariance matrices

% filter data in alpha
EEG.fdata = filterFGx(EEG.data,EEG.srate,11,4);

% initialize to zeros
[covS,covR] = deal( zeros(EEG.nbchan) );

for i=1:EEG.trials
    
    % detrend instead of demean
    tmp  = detrend(squeeze(EEG.data(:,:,i))')';
    covR = covR + tmp*tmp'/EEG.pnts;
    
    tmp  = detrend(squeeze(EEG.fdata(:,:,i))')';
    covS = covS + tmp*tmp'/EEG.pnts;
end

%% cross-validation

% range of gamma parameter values
gammas = linspace(0,.5,43);

% initialize matrices
[maxLambdas,comptsRMS,reguEigRat] = deal(zeros(size(gammas)));


% loop over gamma values
for gi=1:length(gammas)
    
    % regularize
    g = gammas(gi);
    R = (1-g)*covR + g*mean(eig(covR))*eye(EEG.nbchan);
    
    % GED and sorting index
    [evecs,evals] = eig(covS,R);
    [~,sidx] = sort(diag(evals),'descend');
    
    % component time series
    comp_tsB = evecs(:,sidx(1))'*reshape(EEG.data,64,[]);
    comp_tsF = evecs(:,sidx(1))'*reshape(EEG.fdata,64,[]);
    
    % store max eigenvalue and component energy
    maxLambdas(gi) = max(abs(evals(:)));
    comptsRMS(gi)  = sqrt(mean(comp_tsF.^2)) / sqrt(mean(comp_tsB.^2));
    reguEigRat(gi) = max(eig(R)) / min(eig(R));
end

%% plot the xval results

figure(1), clf
subplot(131)
plot(gammas,maxLambdas,'ks-','markerfacecolor','w','markersize',10)
xlabel('Shrinkage \gamma'), ylabel('\lambda')
title('Maximum eigenvalue')
axis square

subplot(132)
plot(gammas,comptsRMS,'ks-','markerfacecolor','w','markersize',10)
xlabel('Shrinkage \gamma'), ylabel('RMS ratio')
axis square
title('filt:bband RMS')

subplot(133)
plot(gammas,reguEigRat,'ks-','markerfacecolor','w','markersize',10)
xlabel('Shrinkage \gamma'), ylabel('\lambda_{max}/\lambda_{min}')
axis square
title('Max:min eig')


%% regularized GED

[~,bestGammaLoc] = max(comptsRMS);

% regularization parameter
regu_gam = gammas(bestGammaLoc);

% apply regularization
R = (1-regu_gam)*covR + regu_gam*mean(eig(covR))*eye(EEG.nbchan);


% GED etc
[evecs,evals] = eig(covS,R);
[evals,sidx]  = sort( diag(evals),'descend' );
evecs = evecs(:,sidx);
ts = reshape( reshape(EEG.data,EEG.nbchan,[])'*evecs(:,1) ,EEG.pnts,EEG.trials);

% adjust sign
topo = evecs(:,1)'*covS;
[~,mv] = max(abs(topo));
if topo(mv)<0
    topo = -topo;
    ts = -ts;
end


figure(3), clf
subplot(211)
topoplotIndie(topo,EEG.chanlocs);
title([ '\gamma = ' num2str(regu_gam) ])

subplot(212)
plot(EEG.times,mean(ts,2),'k','linew',3)
set(gca,'xlim',[-200 1000])
xlabel('Time (ms)')

%%
