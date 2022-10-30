%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Circular distributions and analyses
%      VIDEO: Draw a vector in polar plane
% Instructor: mikexcohen.com
%
%%

% two numbers to plot
numC = complex(-1.3394,3.2336); % cartesian format
numP = 3.5*exp(1i*2*pi/3.2);    % polar format (a.k.a. Euler format)


figure(1), clf

% option 1: plot in cartesian plane
subplot(121)
% plot vector
plot(,,'k','linew',2)
hold on
% plot dot at end of vector
plot(,,'ro','linew',2,'markerfacecolor','w','markersize',12)
axis([-1 1 -1 1]*norm(numC))

% add a grid to the plot, and draw lines at the 0-axis crossings
% use handles to adjust the color of the lines
grid on
h(1) = plot(,,'linew',2);
h(2) = plot(,,'linew',2);

% now adjust color
set(h,'
xlabel('Real'), ylabel('Imag')
axis square
title('Cartesian (rectangular) format')



% option 2: in a polar plane
subplot(122)
h = polar(,);
set(h,'Color','k','linew',2)
hold on
% now draw the red dot at the end of the vecot
h = polar(,);
set(h,'marker','o','markerfacecolor','w','markeredgecolor','r','markersize',12,'linew',2)


%% bonus

% clear the axis


% plot again using polarplot
h = polarplot
set(h,'Color','k','linew',2)
hold on

h = polarplot
set(h,'marker','o','markerfacecolor','w','markeredgecolor','r','markersize',12,'linew',2)
title('Polar (Euler''s) format')

% change the radial axis 
% (note: works only with polarplot, not polar!)


%%
