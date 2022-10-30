%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Find, min, and max
%      VIDEO: Find local maxima
% Instructor: mikexcohen.com
%
%%

% signal is sinc plus linear trend
x  = -4*pi : .01 : 16*pi;
fx = sin(x)./x + linspace(-1,1,length(x));

figure(1), clf
plot(
xlabel('X'), ylabel('f(x)')
% adjust axis limits
set(gca,'xlim', ,'ylim', )


% global maximum
[maxval,maxidx] = max(fx);
hold on
plot(,,'ko','linew',2,'markersize',15,'markerfacecolor','r')


% one option: "local" maximum is the global max in a restricted range
range4max = [-5 5];
rangeidx  = 

[maxLval,maxLidx] = 
% plot it (note the -1 offset!)
plot(,,'ko','linew',2,'markersize',15,'markerfacecolor','g')

%% local minima/maxima

% find local maxima and plot
peeks = find(diff(sign(diff(fx)))<0)+1;
plot(x(peeks),fx(peeks),'ro','linew',2,'markersize',10,'markerfacecolor','y')

% try again using detrended signal
peeks = 
plot(x(peeks),fx(peeks),'bs','linew',2,'markersize',10,'markerfacecolor','b')

%%
