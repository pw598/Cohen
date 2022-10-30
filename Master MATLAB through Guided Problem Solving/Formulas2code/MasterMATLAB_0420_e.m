%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Translate formulas into code
%      VIDEO: Functions involving the natural exponent
% Instructor: mikexcohen.com
%
%%

%% Laplace distribution

% parameters
lambda = 3; % lambda
x = -5:.01:5;

% here's the function
f = 

% plot the probability density
figure(1), clf
subplot(211)
plot(x,f,'k','linew',3)
xlabel('x'), ylabel('p( f(x) )')

% plot the cumulative density function
subplot(212)
plot(x,
xlabel('x'), ylabel('p( f(x) )')

%% log-normal distribution

% x-range and function parameters
x = linspace(0,5,100);
m =  0;
s = .5;

% PDF of the equation, in two parts
part1 = 
part2 = 

% combine the two parts
lndist = part1 .* part2;

% convert to probability density


% make a plot of the PDF
figure(2), clf
subplot(211)
plot(x,lndist,'k','linew',2)
xlabel('x'), ylabel('p( f(x) )')
title('Probability density function')

% plot the CDF
subplot(212)
plot(x,cumsum(lndist),'k','linew',2)
xlabel('x'), ylabel('\Sigma p( f(x) )')
title('Cumulative density function')

%%
