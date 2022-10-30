%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Translate formulas into code
%      VIDEO: Trig functions and Gaussians
% Instructor: mikexcohen.com
%
%%

% sine wave parameters
time = 0:.01:4*pi;
ampl = 3;
phas = pi/3;
frex = 1;

% compute sine wave
wave = 

% compute cosine
wave = 

% compute tangent
wave = 


% plot
figure(1), clf
plot(time,wave,'linew',2)
xlabel('Time (rad.)')
ylabel('Amplitude')
set(gca,'xtick',0:pi/2:time(end),'fontsize',15)

%% Gaussian

% parameters 
x    = 0:.1:10; % x-axis coordinates
ampl = 3;       % amplitude
cent = 7;       % center of peak
widt = .8;      % width of Gaussian

% define numerator and denominator of exponential
num = 
den = 

% the Gaussian.
gaus =

% and plot.
figure(2), clf
plot(x,gaus,'linew',2)
xlabel('X'), ylabel('Y')

%% bonus: Gaussian-tapered tangent


% combine into one signal
wave = trigf .* gaus;

figure(3), clf
plot(time,wave, 'k','linew',2)

%%
