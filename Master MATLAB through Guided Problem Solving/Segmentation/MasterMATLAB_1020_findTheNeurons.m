%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Segmentation
%      VIDEO: Brain cell size and count
% Instructor: mikexcohen.com
%
%%

% image downloaded from:
% http://atlas.brain-map.org/atlas?atlas=1&plate=100960324#atlas=1&plate=100960324

% read in image and take a look
img = imread('100048576_197.jpg');
figure(1), clf
imshow(img)

% cut out subsection
img = squeeze(mean( img(1073:2335,2180:3803,:) ,3));

% now look at the subsection
imagesc(img), axis image
colormap gray


% find an appropriate threshold
figure(2), clf


thresh = 

% create a binarized thresholded map
threshmap = 

% get information about the 'islands' in that map
units = 


% show an image of the map again
imagesc(img), hold on
contour(threshmap,1,'r')
axis image
colormap gray
zoom on

% remove if too small
unitsizes = cellfun
figure(3), clf
hist(unitsizes,900)
set(gca,'xlim',[0 250])
xlabel('Unit size (pixels)'), ylabel('Count')

% select a pixel threshold
pixthresh = 

% now have to reconstruct a threshmap
threshmapFilt = false(size(threshmap));
for ui=1:units.NumObjects
    
    % skip this unit if too small
    
    
    threshmapFilt(units.PixelIdxList{ui}) = 1;
end

% redraw on previous map
figure(4)
contour


% bonus: color clusters according to size
sizecolormap = nan(size(img));
for ui=1:units.NumObjects
    sizecolormap
end

% bonus: create alpha map (transparency)
alphmap = ones(size(img));
alphmap

figure(5), clf
imagesc(
set(gca,'clim',[0 7])

%%
