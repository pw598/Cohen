%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Segmentation
%      VIDEO: Derivative-based time series segmentation
% Instructor: mikexcohen.com
%
%%

% random smooth time series
N = 1000; % days
tv = (0:N-1)/30;
gwin = exp( -zscore(tv).^2/.0001 );

% "stock market": smoothed noise plus linear trend
signal = conv(cumsum(randn(N,1)),gwin,'same') + ;


% compute derivative
signalD = 


% pick some threshold based on normalized derivative
figure(1), clf
hist(zscore(signalD),150)

% select threshold (standard deviation units)
zthresh = 

% find extreme derivative points up and down
deriv_hi = 
deriv_lo = 

% create new time series of NaN's with selected time points
jumpUp = nan(N,1);


jumpDn = 




% plot
figure(2), clf, hold on
plot(tv,signal,'k')
plot(tv,jumpUp,'g','linew',3)
plot(tv,jumpDn,'r','linew',3)

set(gca,'xlim',tv([1 end]),'xtick',0:6:max(tv),'ytick',[])
legend({'"Stock market"';'Good times';'Bad times'})
xlabel('Time (months)'), ylabel('Market value')
title([ 'Stock market values with shifts of ' num2str(zthresh) 'std indicated.' ])

zoom on


%%
