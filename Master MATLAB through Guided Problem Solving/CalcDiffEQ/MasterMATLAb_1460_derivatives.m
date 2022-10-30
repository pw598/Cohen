%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Calculus and differential equations
%      VIDEO: Function derivatives
% Instructor: mikexcohen.com
%
%%

% compute derivative of symbolic equation sin(x)
syms x
f  = 
df = 

% plot the function and its derivative
figure(1), clf
subplot(211)
fplot(
fplot(
% make the legend
legend({[  ],[  ]})


% evaluate the function and derivative at a specified point
a = pi/3;
subs
subs



% now the same thing with numeric variables
t  = -5:.001:5;
q  = 
dq = 
subplot(212)
plot(
plot(
legend({'f(q)','dq'})

%% a more difficult problem

% the function
f  = 

% its derivative
df = 

% make it look nicer
pretty(df)

% and plot everything
figure(2), clf
fplot(f,'linew',2), hold on
fplot(df,'linew',2)
legend({'f(x)';'df'})
set(gca,'ylim',[-300 300])

%%
