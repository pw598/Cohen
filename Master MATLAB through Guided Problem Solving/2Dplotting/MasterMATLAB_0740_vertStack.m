%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Vertically stacking data series
% Instructor: mikexcohen.com
%
%%

% simulation details
nchannels = 50;
npnts     = 1000;

% create correlated multivariate time series
cormat = 
[evecs,evals] = 
data = 

% optional: detrended-integral of time series looks more realistic
data = detrend( cumsum(data,2)' )';

figure(1), clf
plot(1:npnts,data)


% vertically stack the data
figure(2), clf, hold on
for i=1:nchannels
    plot(1:npnts,
end

% the single-line option
figure(3), clf
plot(1:npnts, 
xlabel('Time (a.u.)')
set(gca,'ytick',[])

%%
