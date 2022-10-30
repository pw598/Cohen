%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Dots
% Instructor: mikexcohen.com
%
%%

% generate 2D data
n = 1000;
% dimension 1 is e^x
% dimension 2 is random ~N(0,1)

figure(1), clf

% use a plot handle to specify options
h = plot(

% have a look at the options to set
get(h)

% use set to make the plot look more interesting
set(h,'marker','p')
set(h,

%% scatter

% basic use
scatter(data(1,:),data(2,:))

% include marker size and filled
scatter(data(1,:),data(2,:),200,'filled')

% include color as 4th option


%%
