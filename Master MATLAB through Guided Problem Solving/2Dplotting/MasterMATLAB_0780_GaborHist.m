%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Gabor patch marginal histograms
% Instructor: mikexcohen.com
%
%%

% sine frequency
sinefreq = .005;  % arbitrary units

% sine phase
sinephas = -pi/4;

% width of gaussian (a.u.)
width = 50;

% resolution of the image
n = 200;

% sine wave initializations
[X,Y] = ndgrid(-n:n);
Xp    = 

% compute sine wave
sine2d = 

% create Gaussian
gaus2d = 

% point-wise multiply the image and Gaussian
img = 


figure(1), clf

% create an axis for the Gabor patch
gab_ax = axes;
% position property is: [left bottom width height]
set(gab_ax,'Position',[.1 .1 .7 .7])
imagesc(-n:n,-n:n,img)
axis xy
clim = max(abs(img(:)));
set(gca,'clim',[-clim clim]*.7,'xtick',[],'ytick',[])


% create axes for the marginal distributions
rt_ax = 
set(rt_ax,'Position',[])

tp_ax = 
set(tp_ax,'Position',[])


% now plot into those axes
plot(,'k','linew',3)
plot(,'k','linew',3)

% turn of the axes
axis(rt_ax,'off')
axis(tp_ax,'off')

% set the figure background to be white


%%
