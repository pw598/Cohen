%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Find, min, and max
%      VIDEO: Find negative extrema in a 2D function
% Instructor: mikexcohen.com
%
%%

% a neat-looking 2D function:
x   = linspace(-1,4,100);
y   = linspace(-1,2,80);
fxy = 

% let's see what it looks like
figure(1), clf
surf(x,y,fxy)
shading interp
axis square, rotate3d on
xlabel('X'), ylabel('y'), zlabel('f(x,y)')


% what happens with max?
[val,idx] = max(fxy);

% one possibility:
maxval = max(max( 
[xi,yi] = find( 
fxy(xi,yi)

% ... but the instructions were to find the minimum
minval = 
[xi,yi] = 
fxy(xi,yi)

% plot the minimum as a red ball
hold on


%% bonus: find points below a threshold of .01

% use min(min()) to find minima within a threshold
[xi,yi] = find( fxy
% but it's not exactly what you might expect:
size( fxy(xi,yi) )

% to get the values, you'd need to convert from 
%    matrix indices to linear indices
idx = 

% plot the close-to minimum points
plot3(,,fxy,'ro','markerfacecolor','m','markersize',12)

%%
