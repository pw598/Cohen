%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning univariate time series
%      VIDEO: Polynomial fitting to remove drifts
% Instructor: mikexcohen.com
%
%%

% create signal
n = 10000;
t = (1:n)';
k = 10; % number of poles for random amplitudes

% original signal is a slow interpolated set of points
slowdrift = interp1(100*randn(k,1), ,'pchip')';

% signal is that plus noise
signal = slowdrift + 20*randn(n,1);


%% bonus: empirically determine the optimal polynomial order

orders = (5:40)'; % possible orders
sse1 = zeros(length(orders),1); % sum of squared errors

% loop over orders
for ri=1:length(orders)
    
    % compute the polynomial
    yHat = 
    
    % compute SSE for this order
    sse1(ri) = 
end

% Bayes information criteria
bic = n*log(sse1) + orders*log(n);

% best parameter has lowest BIC
[bestP,idx] = min(bic);


% plot BIC for all orders, and put a red circle on the best one
figure(1), clf
plot(
plot(,,'ro','markersize',10,'markerfacecolor','r')
zoom on

%%

% without the above code, use:
orders = 25; idx=1;

% polynomial fit
polycoefs = 

% estimated data based on the coefficients using polyval
yHat = 

% the filtered signal is the difference of original and fitted 
% (aka residual)
filtsig = 


% plot the original signal
figure(2), clf, hold on
h = plot(,);
set(h,'color',[1 1 1]*.6)

% plot the polynomial fit
plot(,,'r','linew',2)

% plot the new filtered signal
plot(,,'k')
set(gca,'xlim',t([1 end]))

legend({'Original';'Polynomial fit';'Filtered'})

%%
