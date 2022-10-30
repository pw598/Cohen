%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Descriptive statistics
%      VIDEO: Data transformations
% Instructor: mikexcohen.com
%
%%

% create log-normal distribution
data = exp( 2+randn(10000,1)/2 );
[yo,xo] = hist(data,100);


% apply logarithm transform and get distribution
datalog = 
[yl,xl] = hist(datalog,100);


% square root
datasqt = 
[ys,xs] = hist(datasqt,100);


% rank (order)
datarnk = 
[yr,xr] = hist(datarnk,100);



figure(1), clf, hold on
plot(xo,yo,'k','linew',2)
plot(xl,yl,'r','linew',2)
plot(xs,ys,'b','linew',2)
plot(xr,yr,'ms-','linew',2)

legend({'Original';'Log';'Square root';'Ranked'})
set(gca,'xlim',[0 100])
xlabel('Value'), ylabel('Count')

%% bonus: transform any distribution to Gaussian ("normal")

% 1) rank-transform the data
% 2) scale the ranked values to a range of -1 to +1
% 3) apply the inverse hyperbolic tangent

N = 10000;

% create non-normal data
data = linspace(100,.001,N) .* rand(1,N);

figure(2), clf
subplot(221)
plot(data)
title('Data')

subplot(222)
hist(data,round(N/20))
title('Data distribution')


%%% now transform
% step 1: rank
dataR = 

% step 2: scale to -/+1

% step 3: inverse hyperbolic tangent


subplot(223)
plot(dataR)
title('Transformed data')

subplot(224)
hist(dataR,round(N/20))
title('Transformed distribution')

%%
