%%
%     COURSE: PCA and multivariate neural signal processing
%    SECTION: Source separation with GED
%      VIDEO: GED geometric intuition with covariance surfaces
% Instructor: sincxpress.com
%
%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc

%%

load sampleEEGdata.mat
EEG.data = double(EEG.data);

%% first project down to N components

% covariance from all broadband data
covA = zeros(EEG.nbchan);
for triali=1:EEG.trials
    tmp  = detrend( EEG.data(:,:,triali)' )';
    covA = covA + tmp*tmp'/EEG.pnts;
end

% PCA and sort
[V,D]  = eig(covA/EEG.trials);
[D,sx] = sort(diag(D),'descend');
% sort eigvecs
V = V(:,sx);

% convert evals to %change
D = 100*D/sum(D);

% which components to keep (threshold of % total variance accounted for)
comps2keep = D>1;
nComps = sum(comps2keep);


% copmute subspaced data
EEG.subdata = reshape( (V(:,comps2keep))'*reshape(EEG.data,EEG.nbchan,[]) ,[nComps EEG.pnts EEG.trials]);


%% stage 2 starts here

% filter PC components
EEG.fdata = filterFGx(EEG.subdata,EEG.srate,11,4);


% covariance matrices
[covT,covB] = deal( zeros(nComps) );
for i=1:EEG.trials
    tmp = detrend(squeeze(EEG.subdata(:,:,i))')';
    covB = covB + tmp*tmp'/EEG.pnts;
    
    tmp = detrend(squeeze(EEG.fdata(:,:,i))')';
    covT = covT + tmp*tmp'/EEG.pnts;
end

% GED and sort
[evecs,evals] = eig(covT,covB);
[evals,sidx]  = sort( diag(evals),'descend' );

% time series from only the PCA components
ts = reshape( evecs(:,sidx(1))'*reshape(EEG.subdata,nComps,[]) ,EEG.pnts,EEG.trials);

% note the additional transformation using PCA eigenvectors
topo = evecs(:,sidx(1))'*covT*V(:,1:nComps)';

[~,mv] = max(abs(topo));
if topo(mv)<0
    topo = -topo;
    ts = -ts;
end

% plot
figure(1), clf
subplot(211)
topoplotIndie(topo,EEG.chanlocs);

subplot(212)
plot(EEG.times,mean(ts,2),'linew',3)
set(gca,'xlim',[-200 1000],'fontsize',18)
xlabel('Time (ms)'), ylabel('Activity')
box off

%% testing...


% PC1_Y = reshape( evecs(:,sidx(1))'*(V(:,comps2keep))'*reshape(EEG.data,EEG.nbchan,[]) ,[EEG.pnts EEG.trials]);
% % fix sign and store maps
% [~,maxe]           = max(abs(PC1_Y));
% MAP_at_Max_ERP     = PC1_Y * sign(PC1_Y(maxe));
% 
% % Plotting
% figure(3);clf
% subplot(2,3,1);
% axis off;
% text(0.2,0.8,sprintf('D > %1.1f%%\nN_c=%d/%d',100*threshold,r,N_chan),'FontSize',18)
% subplot(2,3,2)
% topoplotIndie(MAP_at_Max_ERP,EEG.chanlocs,'numcontour',0);
% axis off;
% subplot(2,1,2);
% plot(time,GED_max_Time);
% grid on;
% title('Does not look correct')
% xlabel('Time [ms]\rightarrow')
% ylabel('Activity [a.u.] \rightarrow')
% xlim([-200 1000]);
