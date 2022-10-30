%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Fit a Gaussian to a distribution
% Instructor: mikexcohen.com
%
%%

% parameters of the Gaussian
peak = 4;
fwhm = 1;
cent = 3;
nois = .5;

x = -10:.1:10;

% create Gaussian and add noise
gaus = 
gaus = gaus + 


% initialize:  peak  fwhm  center
initParms = [                     ];
funch = @(initParms) fitGaussian(initParms,x,gaus);

% run function minimization
figure(1), clf
[outparams,sse,exitflag,fmininfo] = fminsearch(funch,initParms);

%% Bonus: SSEs for a range of center and peak starting values

% list center and peak starting value ranges
cents = 
peeks = 

% initialize matrix of sum of squared errors
sses  = 

% loop over parameter spaces
for centi=1:
    for peaki=1:
        
        % define initial parameters and function
        initParms = [  ];
        funch = @(initParms) fitGaussian(initParms,x,gaus);
        
        % run minimization
        fminsearch(funch,initParms);
        
        % populate SSE matrix
        sses(centi,peaki) = sse;
    end
end

% show results as an image
figure(2), clf
contourf(cents,peeks,sses,40,'linecolor','none')
xlabel('Peak starts'), ylabel('Center starts')

%%
