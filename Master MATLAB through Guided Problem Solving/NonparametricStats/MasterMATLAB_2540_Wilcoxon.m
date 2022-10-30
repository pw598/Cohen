%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: Wilcoxon rank test
% Instructor: mikexcohen.com
%
%%

% two log-norm datasets
N = 40;
data1 = exp
data2 = exp

% plot the distributions
figure(1), clf
plot(,,'bo','markerfacecolor','k','markersize',15,'linew',3)
set(gca,'xlim',[.5 2.5],'xtick',[1 2],'xticklabel',{'data 1';'data 2'})

% test their difference
ranksum

% print test results in title
title([ 'Difference Z='  ', p='  ])

%%
