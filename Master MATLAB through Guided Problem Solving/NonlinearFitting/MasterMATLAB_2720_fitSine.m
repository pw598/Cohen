%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Fit a sine wave
% Instructor: mikexcohen.com
%
%%

% parameters of the sine wave
a = 4;    % amplitude
f = 14;   % frequency
p = pi/3; % phase
n = 500;  % number of data points

% create a sine wave using normalized time points
x = 

% initialize:  a   f   p
initParms = [    ];
funch = @(initParms) fitSine(initParms,x);

figure(1), clf
[outparams,sse,exitflag,fmininfo] = fminsearch(funch,initParms);

%% bonus: timing with and without visualization


%%
