%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Fit a circle to a noisy ring
% Instructor: mikexcohen.com
%
%%

N = 100;

% define theta for circle perimeters
th = linspace( % theta (angles)
r  = 3; % radius

% need Cartesian coordinates from polar coords.
x = 
y = 

% plot the ring
figure(1), clf
plot(x,y,'s')
axis square


% initialize radius and setup function min
initParms = 6;
funch = @(initParms) fitCirc(initParms,[x; y]);


% fit the model using fminsearch
figure(1), clf
[outparams1,sse1,exitflag1,fmininfo] = 

% fit the model using lsqnonlin
[outparams2,~,sse2,exitflag2,lsinfo] = 

%% computation time and SSE tests

% number of repetitions
nreps = 100;

% initialize
[sses,comptime] = deal( zeros(2,nreps) );

% loop
for repi=1:nreps
    
    % start timer and run fminsearch
    tic
    
    % stop timer and collect data
    comptime(1,repi)
    sses(1,repi) 
    
    % same for lsqnonlin
    tic
    
    comptime(2,repi)
    sses(2,repi) 
end

% plot the computation times
figure(2), clf
subplot(121)
plot(,,'o','markersize',16,'markerfacecolor','k')
set(gca,'xlim',[0 3],'xtick',1:2,'xticklabel',{'?';'?'})
ylabel('Computation times (ms)')

% plot the SSEs
subplot(122)
plot(,,'o','markersize',16,'markerfacecolor','k')
set(gca,'xlim',[0 3],'xtick',1:2,'xticklabel',{'?';'?'})
ylabel('Sum of squared errors')

%% bonus...



%%
