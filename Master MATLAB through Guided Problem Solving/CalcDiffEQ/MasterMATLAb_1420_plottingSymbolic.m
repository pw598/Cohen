%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Calculus and differential equations
%      VIDEO: Plotting functions with symbolic toolbox
% Instructor: mikexcohen.com
%
%%

%% using ezplot

figure(1), clf

fx = '10*sin(x)';
h = ezplot
set(h,'linew',2)

%% using fplot

fy = @(y) 10*sin(y) + tan(y/2)/10;
h = fplot
set(h,'linew',2)

%% plotting implicit functions

% define function as anonymous
fts = 


% also a nice one: cardioid-inspired function
%fts = @(t,a,b) 2*a.*(1-cos(t))+abs(b);

h = fimplicit3
rotate3d on, axis image
set(h,'linestyle','none')

%% polar plot

% cardioid as anonymous function
cardioid = 
h = ezpolar
set(h,'linew',2,'color','r')

%%
