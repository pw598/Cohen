%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Blend images by averaging and transparency
% Instructor: mikexcohen.com
%
%%

%% first, a bit about using alpha (transparency) maps

M = [1 2 3;
     4 5 6];

% use alphadata to control the invisibility
alphdat = [  0 .5 1;
             0 .5 1];

figure(1), clf
subplot(131)
imagesc(M), axis square
title('Image, no alpha')

subplot(132)
imagesc(alphdat), axis square
title('Alpha (transparency) map')

subplot(133)
imagesc(M,'AlphaData',alphdat), axis square
title('Image with alpha')

%% now for the pictures

% import images
car = % car1.jpg
tap = % tape.png

% reduce to 2D to facilite the programming
car = mean(car,3);
tap = mean(tap,3);

% size of car image
carsize = size(car);

% let's have a look at these pictures
figure(2), clf
subplot(121), imagesc(car)
axis image

subplot(122), imagesc(tap)
axis image

colormap gray

% resample the tape so the two images are the same size
% if you have the image processing toolbox:
tapR = imresize(tap,size(car));

% otherwise:
[X,Y] = meshgrid(linspace(1,size(tap,1),carsize(1)),linspace(1,size(tap,2),carsize(2)));
tapR1 = interp2(tap,Y,X)';

%% image blending

% simple averaging
figure(3), clf
imagesc( 
axis image, colormap gray

% maybe more interesting to use transparency?
figure(10), clf
imagesc(car
hold on
imagesc(tapR
colormap gray, axis image

%% try spatial patterns of transparency

% create a vector of transparency values
% vector length should match 2nd dimension of picture
alphdat = 

figure(4), clf
imagesc(car,'AlphaData',repmat(alphdat,carsize(1),1))
colormap jet, axis image

%% now mix the two pictures using transparency

% vector of transparencies, just like above

figure(5), clf
h1 = imagesc(car,'AlphaData',repmat(alphaLat,carsize(1),1));
hold on
h2 = imagesc(tapR,'AlphaData',repmat(1-alphaLat,carsize(1),1));
colormap gray
axis image

%% old-school movie wipe

% hint: use a sigmoid for transparency to get
%       a quick transition, then adjust the
%       lateral offset of the sigmoid
x = linspace(-5,5,carsize(2));

for ti=logspace(log10(.01),log10(100),20)
    
    % create sigmoid alpha curve
    sigmoid = 
    
    % set alpha data for image handle
    set(h2,'AlphaData',
    pause(.005)
end

%%
