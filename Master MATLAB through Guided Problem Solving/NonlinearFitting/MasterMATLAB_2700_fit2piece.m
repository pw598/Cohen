%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Two-piece linear regression
% Instructor: mikexcohen.com
%
%%

% generate a triangle distribution
a = .2;
c = .6;
b = .9;
x = rand(1,10000);

y(x<Fc) = 
y(x>Fc) = 


% convert x and y into a distribution
[y,x] = 

% initial point
initB = rand*length(x);

% create a function handle
funch = @(initB) fit2segLinear(initB,x,y);

% and fit the model!
figure(2), clf
[optBreakPoint,sse,exitflag,fmininfo] = fminsearch(funch,initB);

%%
