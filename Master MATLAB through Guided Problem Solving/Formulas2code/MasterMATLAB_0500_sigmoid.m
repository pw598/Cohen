%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Translate formulas into code
%      VIDEO: Sigmoid function
% Instructor: mikexcohen.com
%
%%

% sigmoid parameters
a =  1.4; % amplitude (maximum value)
b =  2; % steepness ("heat" parameter)
c = -1; % x-axis shift

% x-axis points
x = linspace(-5,5,400);

% here's the main function
sigmoid = 

% and plot
figure(5), clf
plot(x,sigmoid,'linew',3)
hold on
plot([0 0],get(gca,'ylim'),'k--')

% plot parameter intersection lines


xlabel('x'), ylabel('f(x)')


%%
