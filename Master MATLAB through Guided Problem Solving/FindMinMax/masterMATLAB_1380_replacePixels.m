%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Find, min, and max
%      VIDEO: Replace image pixels in an intensity range
% Instructor: mikexcohen.com
%
%%

% the picture
car = imread('car.jpg');

% sum all color dimensions
carS = 

% show the original image
figure(1), clf
subplot(311)
imagesc(car)
axis image, axis off

% show the histogram of intensity values
subplot(312)
[y,x] = 
plot(,,'k','linew',3)
xlabel('Pixel intensity'), ylabel('log-count')
title('Pixel intensity histogram')

% pick color range based on histogram
crange = [ ];

% plot lines at the boundaries





% find those pixels in the image
inrange = 

% the new RGB values
newCvals = [200 20 255];


% loop through color channels and replace
for i=1:3
    
    
end

% and view
subplot(313)
imagesc(car)
axis image, axis off


%%
