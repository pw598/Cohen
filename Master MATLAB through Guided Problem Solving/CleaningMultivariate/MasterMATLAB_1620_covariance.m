%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning multivariate time series
%      VIDEO: Three ways to make a covariance matrix
% Instructor: mikexcohen.com
%
%%

% load the dataset. dimensions are channels X time X repetitions (trials)
load multivar_data.mat

% we'll work with the trial-average here
data = mean(data,3);

% convenient to have conveniently accessible data sizes
datadim = size(data);

%% the method with loops

% initialize
covmat1 = zeros(datadim(1));

% double-loop over channels and compute dot product scaled by N-1
for chani=1:datadim(1)
    for chanj=1:datadim(1)
        
        % mean-center data
        subi = data(chani,:)
        subj = data(chanj,:)
        
        % compute covariance
        covmat1(chani,chanj) = 
    end % end chanj
end % end chani


%% using matrix multiplication

% first mean-center (over time!)
dataM = 

% all pairwise dot products as the matrix times its transpose
covmat2 = 


%% using MATLAB's cov function

covmat3 = 

% always check the size to make sure it's the correct orientation:
size(covmat3)

%% show all three in a plot

figure(1), clf

titles = {'Using loops';'Matrix multiplication';'MATLAB cov function'};

% make images of all three matrices (bonus: in one loop using eval!)
subplot(131)
imagesc(covmat1)
axis square
title(titles{1})
xlabel('Channel'), ylabel('Channel')


%%
