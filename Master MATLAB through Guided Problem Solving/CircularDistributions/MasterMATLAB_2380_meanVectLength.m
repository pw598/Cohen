%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Circular distributions and analyses
%      VIDEO: Compute and plot mean vector length
% Instructor: mikexcohen.com
%
%%


% number of time points
n = 60;

% generate phase-uniform distribution
phs1 = angle(hilbert( 

% generate phase-nonuniform distribution
phs2 = angle(hilbert( 

% mean vector (complex)
meanvec1 = 
meanvec2 = 



% now show the distributions and mean vector
figure(1), clf
subplot(121)
h = polarplot([zeros(1,n); phs1]
set(h,'linew',2,'color',[.8 .6 .9])
hold on
h = polarplot
set(h,'linew',7,'color','k')
title([ 'Mean vector length = ' num2str(abs(meanvec1)) ])


subplot(122)
h = polarplot
set(h,'linew',2,'color',[.8 .6 .9])
hold on
h = polarplot
set(h,'linew',7,'color','k')
title([ 'Mean vector length = ' num2str(abs(meanvec2)) ])

%%
