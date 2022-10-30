%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Fractal time series and images
%      VIDEO: The Sierpinski triangle
% Instructor: mikexcohen.com
%
%%

% number of points in the image
N = 10000;

% initialize x and y vectors
[sx,sy] = 


% populate the Sierpinksi image
for i = 2:N
    
    % random number k
    k = 
    
    % pick x and y points
    sx(i) = 
    sy(i) = 
end

% plot those points
figure(1), clf
plot(sx,sy,'k.')
axis off
set(gcf,'color','w')
title('Sierpinski triangle using spare coding')

%% bonus: animate dots

% compute the skip amount (controls speed)
skip = 

% setup the plot
h = plot(sx,sy,'k.');

for i=1:skip:N
    set(h,'XData',sx,'YData',sy)
    pause(.001)
end

%%
