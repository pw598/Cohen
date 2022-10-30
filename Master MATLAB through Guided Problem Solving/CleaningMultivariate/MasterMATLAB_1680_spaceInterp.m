%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning multivariate time series
%      VIDEO: Space-based single channel interpolation
% Instructor: mikexcohen.com
%
%%


% run the code from the previous project to generate multivariate space-time data

% first, corrupt several channels
prop2corrupt = .1; % fraction of channels to remove

% pick the sensors to replace with noise
badsensors = 
badsensors = badsensors(1:ceil(prop2corrupt*N^2));

% loop through time and replace those pixels
multidataC = multidata;
for ti=1:npnts
    % get the data from this time point
    tmp = squeeze(multidata(ti,:,:));
    
    % replace the bad sensors with large-amplitude noise
    tmp(badsensors) = 
    
    % then put that matrix back into the corrupted data
    
end


figure(1), clf

% setup the figure for a video
subplot(131)
oh = imagesc(squeeze( mean(multidata,1) ));
set(gca,'clim',[-1 1]*2), axis square
title('Original data');

subplot(132)
ch = imagesc(squeeze( mean(multidata,1) ));
set(gca,'clim',[-1 1]*2), axis square
title('Corrupted data');

% loop through time and update the display
for ti=1:npnts
    
    
    pause(.05)
end


% how to identify the bad sensors? 
% let's start by assuming that bad sensors have very large variance.
% Thus, in a separate figure, show a plot of the standard deviation over time at each sensor.
figure(2), clf
imagesc(

% now let's see a histogram of the standard deviations
tmp  = reshape( squeeze(std(multidataC,[],1)) ,1,[]);
tmpz = 
histogram(tmpz,30)


% pick a threshold and identify the sensors to interpolate
sensors2interp = 

%% now for the interpolation

% initialize
multidataR = zeros(npnts,N,N);

% loop over tiem points
for ti=1:npnts
    
    % get a 2D frame of data
    
    
    % use scatteredInterpolant to define an interpolation function
    F = scatteredInterpolant
    
    % apply the function to estimate missing data
    p = F(
    
    % put the missing data back in the frame
    oneframe(sensors2interp) = 
    
    % finally, put that frame back into the dataset
    multidataR(ti,:,:) = 
end

%%

% final video of all images

% setup the original dataset
subplot(131)
imgh1 = 
set(gca,'clim',[-1 1]*2), axis square
title('Original data');

% setup the corrupted dataset (same as above)
subplot(132)


% setup the interpolated (reconstructed) dataset
subplot(133)


% loop through time points and update the displayes
for ti=1:npnts
    
    set(imgh1,'CData',squeeze(
    set(imgh2,'CData',squeeze(
    set(imgh3,'CData',squeeze(
    
    pause(.05)
end


%%
