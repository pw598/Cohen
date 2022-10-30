%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning multivariate time series
%      VIDEO: Spatial sharpening via Laplacian
% Instructor: mikexcohen.com
%
%%


%% first, an aside: application of Laplacian to Gaussian

% create a 2D Gaussian
[X,Y] = 
G = 

% Laplacian kernel
kernel = [0 1 0; 1 -4 1; 0 1 0];

% convolve the two using MATLAB's conv2 function
lapGaus = 

figure(1), clf
subplot(131)
surf(G), shading interp, axis square, rotate3d on

subplot(132)
imagesc(kernel), axis square

subplot(133)
surf(lapGaus), shading interp, axis square, rotate3d on

%% now for the project

% first, re-run the simulation to create data, but without noise

% initialize the matrix
multidataL = 

% loop over time
for ti=1:npnts
    
    % extract one frame of data
    oneframe = squeeze(multidata(ti,:,:));
    
    % use 2D convolution like above
    tmp = 
    
    % replace this time point of data with the filtered frame
    multidataL(ti,:,:) = 
end % end time points

% optional: zero-out the edges


%%

figure(2), clf
% setup the original dataset
subplot(121)
imgh1 = imagesc(squeeze( mean(multidata,1) ));
set(gca,'clim',[-1 1]*2), axis square
title('Original data');

% setup the sharpened dataset
subplot(122)
imgh2 = imagesc(squeeze( mean(multidata,1) ));
set(gca,'clim',[-1 1]*.01), axis square
title('Laplacian data');


% loop through time points and update the displays
for ti=1:npnts
    
    % use set to update color data in the above images
    set(imgh1,'CData',squeeze(multidata(ti,:,:)))
    set(imgh2,'CData',squeeze(multidataL(ti,:,:)))
    
    pause(.05)
end

%%
