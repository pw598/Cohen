%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Functions and anonymous functions
%      VIDEO: Same-length differentiation
% Instructor: mikexcohen.com
%
%%

% length of data series
n = 100;
t = (0:n-1)/n;

% n-point signal
x = randn(1,n) + linspace(0,10,n);

% first and second derivatives
dx   = diff(x);
ddx1 = diff(diff(x));
ddx2 = diff(x,2);

% notice lengths of the variables
whos x d*


figure(1), clf
plot(t,x,'linew',2)
hold on
plot(t,dx,'linew',2)

%% 

% get only the first output of diffx
 = diffx(x);

% get only the second output of diffx
 = diffx(x);

% plot x, dx, ddx using the original t
figure(2), clf
plot(t,x, t,dx, t,ddx)

