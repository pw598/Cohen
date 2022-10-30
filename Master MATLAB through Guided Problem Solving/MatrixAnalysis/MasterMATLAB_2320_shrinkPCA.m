%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Covariance shrinkage regularization in PCA
% Instructor: mikexcohen.com
%
%%

%% create dataset (see video "PCA of low-rank space-time data")

[X,Y] = meshgrid(-1:.2:1);
Z = exp( -(X.^2+Y.^2) );
n = length(Z);

% generate random time series data
N = 3000; % time points
data = randn(N,3)*[X(:) Y(:) Z(:)]';

data = reshape(data,N,[]);
data = bsxfun(@minus,data,mean(data,1));

% now compute the covariance matrix
covmat = data'*data / (N-1);

%% now for this project

% list of shrinkage factors (gamma) to test
shrinkvals = linspace(0,.1,20);

% initialize eigenvalues/vectors matrices
shreigs = zeros
shrvecs = zeros


% loop over shrinkage values
for shi=1:length(shrinkvals)
    
    % "shrink" the covariance matrix
    shr = shrinkvals(shi);
    covtmp = 
    
    % PCA via eigendecomposition
    [evecs,evals] = 
    
    % sort
    [evals,sidx] = sort
    evecs = evecs;
    
    % put in larger matrices
    shreigs(shi,:) = 
    shrvecs(shi,:,:) = evecs(:,1:3);
end

%% plotting

figure(1), clf

% first, plot the top 5 eigenvalues as a function of shrinkage
subplot(211)
plot(,,'s-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Shrinkage (percent)'), ylabel('\lambda')
legend({'\lambda_1';'\lambda_2';'\lambda_3';'\lambda_4';'\lambda_5'})


% plot the average of the top three eigenvalues
subplot(223)
plot(,,'s-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Shrinkage (percent)'), ylabel('\lambda')
title('First 3 components')

% plot the average of the rest of the eigenvalues
subplot(224)
plot(,,'s-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Shrinkage (percent)'), ylabel('\lambda')
title('All other components')

%% show some eigenvectors

figure(2), clf
for shi=1:5
    
    % plot the top three eigenvectors, reshaped into a matrix
    for ei=1:3
        subplot(5,3,ei+(shi-1)*3)
        imagesc
        axis square, axis off
        
        % an informative title would be nice
        
    end
end

%% 
