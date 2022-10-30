%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: The prickly Gabor patch
% Instructor: mikexcohen.com
%
%%

% sine frequency
sinefreq = .05;  % arbitrary units

% sine phase
sinephas = pi/4;

% width of gaussian (a.u.)
width = 10;

% image resolution (final resolution is 2n+1)
n = 20;

% sine wave initializations
[X,Y] = ndgrid
Xp    = 

% compute sine wave
sine2d = 

% create Gaussian
gaus2d = 

% point-wise multiply the image and Gaussian
img = 


% plot
figure(1), clf

% plot the sine patch
subplot(221)

axis square, axis off, axis xy
title('Sine grating')

% plot the Gaussian
subplot(222)

axis square, axis off
title('2D Gaussian')

% plot the Gabor patch
subplot(212)

axis square, axis off, axis xy
title([ 'Gabor patch at f=' num2str(sinefreq) ', \theta=' num2str(sinephas) ])
clim = max(abs(img(:)));
set(gca,'clim',[-clim clim]*.7)

%% now for the 3D part

figure(2), clf
surfnorm
axis square, axis off
rotate3d on

% here's the wire mesh:
figure(3), clf

axis square, axis off

%%
