%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Calculus and differential equations
%      VIDEO: Solving differential equations
% Instructor: mikexcohen.com
%
%%

% state the problem
syms y(t)
eq = diff(y) == exp(-t) - 2*y;

% find the general solution
dsolve

% find the particular solution, given a specific initial condition
dsolve

%% draw the solutions

% now slope curves
[tt,yy] = meshgrid(linspace(-2,3,30),linspace(-1,2,32));
sol = 

% now divide by length for normalized vectors
figure(2), clf, hold on
L = sqrt(1+sol.^2);
h = quiver(tt,yy,1./L,sol./L,.5);
set(h,'linew',2,'color',[.8 .8 .8])


% specify initial values for the solution y at t=0
initvals = [ 2 1 .75 .5 ];

% draw solution curves for those initial values
h1 = zeros(size(initvals));
for i=1:length(initvals)
    h1(i) = 
end

% set axes limits
axis
set(h1,'linew',3)

%%
