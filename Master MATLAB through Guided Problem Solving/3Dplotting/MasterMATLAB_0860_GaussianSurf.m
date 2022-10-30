%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: Textured Gaussian surfaces
% Instructor: mikexcohen.com
%
%%

% isotropic Gaussian parameters
n = 100; % resolution
s = 2; % width

x = linspace(-5,5,n);
[X,Y] = 

gaus2d = 

figure(1), clf

% basic surf command
surf(x,x,gaus2d)
shading interp
axis square
rotate3d on

% now with interesting color patterns
figure(2), clf
color = 
surf(
axis square, rotate3d on
% interesting option:
shading interp

%% next step: anisotropic Gaussian with picture

n  = 240; % resolution
sx = 1; % width
sy = 3; % width

x = linspace(-5,5,n);
[X,Y] = meshgrid(x);

% anisotropic Gaussian
gaus2d = 

figure(3), clf

% basic surf command
surf(x,x,gaus2d)
shading interp
axis square
rotate3d on

% now with image color patterns
img = imread('hands1.jpg');
% hmm.. is this the right size?


% map the image onto the Gaussian surface
surf(x,x,gaus2d,img)
axis square, rotate3d on, shading interp
colormap gray
axis off

%%
