%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Functions and anonymous functions
%      VIDEO: Damped oscillator
% Instructor: mikexcohen.com
%
%%

%% first, an intro to anonymous functions

% anonymous (aka in-line) functions have this form:
% h = @(input) function_def
fun = @(x)        x.^2;

whos fun

fun(0)
fun(-3)

%% now for the oscillator

% define sampled time
fs = 1000; % Hz
time = 0:1/fs:2; % time in seconds

% define anonymous function to compute damped oscillator
damposc = 

% get oscillation time series using f and d parameters
y = damposc(10,3);


% and plot
figure(2), clf
plot(time,y,'k','linew',3)
xlabel('Time (s)'), ylabel('Amplitude')
title( func2str(damposc) )

%% bonus image of parameter space

% range of decay parameters
taus = linspace(0,10,50);

% initialize
Y = zeros(length(taus),length(time));

% loop over decay parameters and compute damped oscillation
for ti=1:length(taus)
    
end

% make an image of the results
contourf
xlabel('Time (s)')
ylabel('Decay parameter (\tau)')

%%
