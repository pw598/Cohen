%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: PCA of low-rank space-time data
% Instructor: mikexcohen.com
%
%%

% forward model with 3 projections
[X,Y] = meshgrid(-1:.2:1);
Z = exp( -(X.^2+Y.^2) );
n = length

% show each of the projections
figure(1), clf
% projection X (vertical linear)
subplot(231), imagesc
set(gca,'xtick',[],'ytick',[])
axis square

% projection Y (horizontal linear)
subplot(232), imagesc
set(gca,'xtick',[],'ytick',[])
axis square

% projection Z (the Gaussian)
subplot(233), imagesc
set(gca,'xtick',[],'ytick',[])
axis square

% the sum of all projections
subplot(212)
h =  % create image handle for later updating
set(gca,'xtick',[],'ytick',[])
axis square


% generate random time series data
N = 3000; % time points
sourcedata = randn(N,3); % uncorrelated source data

% here's our dataset: time by "sensors"
data = 

% show a movie over time of some data
for i=1:100
    set(h,
    pause(.1)
end

%% now for PCA

% before computing the sensor covariance matrix,
% reshape to 2D and mean-center


% now compute the covariance matrix
covmat = 

% covariance matrices usually look pretty:
figure(2), clf
set(gca,'xtick',[],'ytick',[])
axis square
title([ 'Covariance matrix of sensor array (rank=' num2str(rank(covmat)) ')' ])



% PCA is eigendecomposition of covariance
[evecs,evals] = 

% sort eigenvalues and eigenvectors according to eigenvalue magnitude
[evals,sidx] = 


% plot the eigenspectrum
figure(3), clf
subplot(211)
plot(,'ks-','markersize',10,'markerfacecolor','w')
xlabel('Sorted component order')
ylabel('\lambda')


% image the eigenvectors
for i=1:3
    subplot(2,3,3+i)
    imagesc
    set(gca,'xtick',[],'ytick',[])
    axis square
    title([ 'Component ' num2str(i) ])
end

%%
