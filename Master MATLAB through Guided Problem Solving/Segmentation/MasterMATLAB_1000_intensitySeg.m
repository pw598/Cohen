%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Segmentation
%      VIDEO: Intensity-based image segmentation
% Instructor: mikexcohen.com
%
%%

% size of image (squared)
N = 400;

% create 2D Gaussian for smoothing
tmpvec = 1:round(N/4);
[X,Y]  = meshgrid( tmpvec );
gaus2d = 

% create image and convert to z-values
img  = conv2( 
zimg = 

% pick standard deviation threshold
zthresh = 2;

% binarize the thresholded image (one-tailed!)
[binmap,numclust] = bwlabeln( 



% plot the original image
figure(1), clf
subplot(131)
contourf(zimg,40,'linecolor','none')
axis square
set(gca,'xtick',[],'ytick',[])
title('Original image')


% plot the binarized thresholded map
subplot(132)
imagesc(binmap)
axis square
set(gca,'xtick',[],'ytick',[])
title('Binarized image')


% bonus: plot contours outlining thresholded regions
subplot(133)

axis square
set(gca,'xtick',[],'ytick',[])
title('With contours')


%%
