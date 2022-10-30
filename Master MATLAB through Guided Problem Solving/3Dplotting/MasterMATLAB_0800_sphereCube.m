%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: Plot lines in 3D
% Instructor: mikexcohen.com
%
%%

figure(1), clf, hold on

% draw the bottom lines
plot3([ ],[ ],[ ],'k','linew',2)

% draw the top lines

% draw the vertical lines

axis square
xlabel('x'), ylabel('y'), zlabel('z')

% sphere inside the box
[sx,sy,sz] = sphere;
plot3(,,,'ko','markerfacecolor','m')

% use scatter3 to make a colorful ball


rotate3d on

% turn off the tick marks
set(gca,'xtick',[],'ytick',[],'ztick',[])
% or maybe you prefer the axis off?
%axis off

%%
