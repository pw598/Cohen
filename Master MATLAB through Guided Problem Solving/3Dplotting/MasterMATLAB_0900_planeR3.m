%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: Plane in R3 spanned by two vectors
% Instructor: mikexcohen.com
%
%%

% provide two vectors in R3 (3-D)
v = 
w = 


figure(1), clf, hold on

% plot the "basis" vectors
plot3([],[],[],'r','linew',2)


axis square, rotate3d on


% Plot the subspace spanned by two vectors.
% this code uses inline functions, 
%    and is valid for plane through the origin.
h = ezmesh( @(s,t)v(1)*s+w(1)*t , @(s,t)v(2)*s+w(2)*t , @(s,t)v(3)*s+w(3)*t , [-1 1 -1 1 -1 1]);
set(h,'facecolor','g','cdata',ones(50))
title('')


% any vector defined as a linear combination of v and w
% must also be in the plane
u  = 
uh = plot3([],[],[],'b','linew',2);

% now replace that line with some other random line
u = 
set(uh,'XData',[0 u(1)],'YData',[0 u(2)],'ZData',[0 u(3)])


%%
