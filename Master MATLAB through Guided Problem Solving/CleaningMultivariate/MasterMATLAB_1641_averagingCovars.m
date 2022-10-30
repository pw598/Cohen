%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning multivariate time series
%      VIDEO: Effects of averaging on covariance matrices
% Instructor: mikexcohen.com
%
%%

% dataset parameters
N = 1000;     % time points
M =   20;     % channels (sensors)
nTrials = 50; % trials

% time vector
t = 


% initialize datasets
[data1,data2] = 

% nonlinear relationship across channels
chanrel = sin(

% create dataset per trial
for triali=1:nTrials
    
    % simulation 1 (phase-locked)
    data1(:,:,triali) = sin(t) + randn(M,N);
    
    % simulation 2 (non-phase-locked)
    data2(:,:,triali) = sin(t+rand*2*pi) + randn(M,N);
end


%% compute covariance matrices


% method A: trial average
tmpdat = 
covA1  = tmpdat*tmpdat' / ;

tmpdat = 
covA2  = 



% method B: trial vectorized
tmpdat = 
covB1  = tmpdat*tmpdat' / ;

tmpdat = 
covB2  = 



% method C: trial-unique
[covC1,covC2] = deal( zeros(M) );

for triali=1:nTrials
    tmpdat = 
    covC1  = covC1 + tmpdat*tmpdat' / ;

    tmpdat = 
    covC2  = 
end

% divide by N for average



%% now plot all matrices

figure(1), clf

covmethod = 'ABC';
covnames  = { 'Trial average';'Concatenated';'Trial unique' };



%%
