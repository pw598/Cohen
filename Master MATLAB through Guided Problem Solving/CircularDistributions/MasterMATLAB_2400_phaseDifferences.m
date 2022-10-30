%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Circular distributions and analyses
%      VIDEO: Phase difference between two distributions
% Instructor: mikexcohen.com
%
%%

% generate signals with phase-nonuniform distribution
n = 20;
t = linspace(0,6*pi,n);
sig1 = 
sig2 = 

% plot signals
figure(1), clf
subplot(311)

title('Signals')
ylabel('Amplitude')


% extract phase angles
phs1 = 
phs2 = 

% phase angle difference
phsdiff = 

% plot phase angles
subplot(312)
title('Phase angles')
ylabel('Phase (rad.)')



% plot phase angles from both signals
subplot(325)
h = polarplot([ ; ],bsxfun(@plus,,[]));
set(h,'linew',2,'color','r')
hold on
h = polarplot
set(h,'linew',2,'color','b')
title('Phase angles')


% now plot the phase angle *difference*
subplot(326)
h = polarplot
set(h,'linew',2,'color','r')

% create title
title('Phase angle differences');


% compute mean vector length, and extract magnitude and preferred angle
meanvector = 
meanVmag   = 
meanVang   = 


% plot the average vector on top
hold on
h = polarplot([0 meanVang],[0 meanVmag]);
set(h,'linew',5,'color','k')


% bonus: change title text


%%
