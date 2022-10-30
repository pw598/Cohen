%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Detrended fluctuation analysis
% Instructor: mikexcohen.com
%
%%

% create data with DFA=.5
N = 3001;
signal1 = randn


% create data with "long-term memory" (1/f power spectrum)
as = rand(1,floor(N/2)-1) .* exp(-(1:floor(N/2)-1)/50);
as = [as(1) as 0 0 as(:,end:-1:1)];
fc = 
signal2 = 


% setup parameters and initialize
nScales = 20;
ranges  = round
scales  = logspace(,,nScales));
rmses   = zeros(2,nScales);

% plot the two signals
figure(1), clf
subplot(221)
plot(1:N,signal1)
title('Signal 1: white noise')
xlabel('Time (a.u.)')

subplot(222)
plot(1:N,signal2)
title('Signal 2: pink noise')
xlabel('Time (a.u.)')



% integrate and mean-center the signals
signal1 = cumsum(
signal2 = 

% and show those time series for comparison
subplot(223)
plot(1:N,signal1)
title('Integrated noise')

subplot(224)
plot(1:N,signal2)
title('Integrated noise')



% compute RMS over different time scales
for scalei = 1:nScales
    
    % number of epochs for this scale
    n = N/scales(scalei)
    
    % compute RMS for signal1
    epochs  = reshape( signal1 ,scales(scalei),n);
    depochs = % detrend
    % here is the root mean square computation
    rmses(1,scalei) = 
    
    % repeat for signal1
    epochs  = 
    depochs = 
    rmses(2,scalei) = 
end


% fit a linear model to quantify scaling exponent
A = [ ones(nScales,1) log10(scales)' ];  % linear model
dfa1 = (A'*A) \ (A'*log10(rmses(1,:))'); % fit to signal1
dfa2 = (A'*A) \ (A'*log10(rmses(2,:))'); % fit to signal2


% plot the 'linear' fit (in log-log space)
figure(2), clf, hold on

% plot results for white noise
plot((scales),(rmses(1,:)),'rs','linew',2,'markerfacecolor','w','markersize',10)
plot((scales),dfa1(1)+dfa1(2)*(scales),'r--','linew',2)

% plot results for pink noise
plot((scales),(rmses(2,:)),'bs','linew',2,'markerfacecolor','w','markersize',10)
plot((scales),dfa2(1)+dfa2(2)*(scales),'b--','linew',2)

legend({'Data (S1)';[ 'Fit (DFA m=' num2str(dfa1(2)) ')' ]; ...
        'Data (S2)';[ 'Fit (DFA m=' num2str(dfa2(2)) ')' ] })
xlabel('Data scale (log)'), ylabel('RMS (log)')
title('Comparison of Hurst exponent for different noises')
axis square

%%
