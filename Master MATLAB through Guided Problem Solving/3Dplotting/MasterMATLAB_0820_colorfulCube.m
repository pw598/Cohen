%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: Colorful cube (a.k.a. the happy Borg ship)
% Instructor: mikexcohen.com
%
%%

figure(1), clf

n  = 10;
ni = linspace(0,1,n);
[X,Y] = meshgrid(ni);
x = [X(:) X(:)]';
y = [Y(:) Y(:)]';
z = [zeros(1,n*n); ones(1,n*n)];

% use plot3 to draw all connecting lines


% plot the nodes
hold on
[X,Y,Z] = meshgrid(ni);
color = 
h = scatter3(,,,200,color,'filled');
set(h,

axis square, axis off, rotate3d on

%%
