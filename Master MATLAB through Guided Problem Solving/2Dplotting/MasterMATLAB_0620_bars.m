%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Bars and errorbars
% Instructor: mikexcohen.com
%
%%

%% brief intro to bsxfun

m = rand(4,10);
v = 1:10;

m+v
bsxfun(@plus,m,v)

%%

% data sizes
m = 30; % rows
n =  6; % columns

% create data



figure(1), clf
subplot(131)
% bar plot of average of each feature

axis square, set(gca,'xlim',[0 n+1],'xtick',1:n)
title('Bar plot')


subplot(132)
% errorbar of standard deviation over observations within each feature

axis square, set(gca,'xlim',[0 n+1],'xtick',1:n)
title('Error bar plot')


subplot(133)
% errorbar on top of bar

axis square, set(gca,'xlim',[0 n+1],'xtick',1:n)
title('Bar+error plot')

%% a tangent: series of bars

% data are groups (rows) X property (columns)
m = [2 5 4 3; 1 1 8 6];

figure(2), clf

% conceptualizing the data as <row> groups of <columns>
subplot(221)
imagesc(m), axis image
set(gca,'xtick',1:size(m,2),'ytick',1:size(m,1))

subplot(223)
bar(m)
set(gca,'xticklabel',{'Group 1';'Group 2'},'fontsize',10)
legend({'Property 1';'prop 2';'prop 3';'prop 4'})
title('Grouping by rows')



% now other orientation (property X group)
subplot(222)
imagesc(m'), axis image
set(gca,'xtick',1:size(m',2),'ytick',1:size(m',1))

subplot(224)
bar(m') % note the transpose
set(gca,'xticklabel',{'Property 1';'prop 2';'prop 3';'prop 4'},'fontsize',10)
legend({'Group 1';'Group 2'})
title('Grouping by columns (of original matrix)')


%%
