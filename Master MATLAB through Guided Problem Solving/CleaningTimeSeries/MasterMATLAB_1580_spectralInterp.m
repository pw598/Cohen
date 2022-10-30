%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning univariate time series
%      VIDEO: Spectral mixing interpolation
% Instructor: mikexcohen.com
%
%%

% number of points in signal
n = 10000;

% create signal as integrated noise (brownian noise)
[origsig,signal] = deal( cumsum( randn(n,1) ) );

% remove a specified window
t2kill = [ 4000 4500 ];
signal = nan;


% FFTs of pre- and post-window data
fftPre = fft(
fftPst = fft(

% interpolated signal is a combination of mixed FFTs and straight line
mixeddata = detrend(ifft( 
linedata  = linspace(0,1,diff(t2kill)+1)'* + ; % hint: y=mx+b

% sum the two components together for final result
linterp = m + l;

% put the interpolated piece into the signal
filtsig = signal;
filtsig(t2kill(1):t2kill(2)) = ;

figure(1), clf
plot(1:n,
legend({'Original';'With gap';'Filtered'})
zoom on

%%
