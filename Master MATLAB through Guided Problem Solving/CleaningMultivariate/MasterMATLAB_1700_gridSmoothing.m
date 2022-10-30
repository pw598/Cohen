%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning multivariate time series
%      VIDEO: Spatial smoothing on a grid of channels
% Instructor: mikexcohen.com
%
%%

% re-run the simulation to create data, but add noise

% size of the mean-smoothing kernel
k = round(N/20);

% initialize
multidataS = zeros( size(multidata) );


% loop over time
for ti=1:npnts
    
    % extract one frame
    oneframe = 
    
    % double-loop over i,j coordinates
    for i=1:N
        for j=1:N
            
            % extract a piece of the image of k pixels around the i,j pixel
            tmp = 
            
            % replace pixel value as average of that cluster
            multidataS(ti,i,j) = 
        end % end j
    end % end i
    
    % alternative: use 2D convolution

    
end % end time points


%%


figure(1), clf
% setup the original dataset
subplot(121)
imgh1 = imagesc(squeeze( mean(multidata,1) ));
set(gca,'clim',[-1 1]*2), axis square
title('Original data');

% setup the smoothed dataset
subplot(122)
imgh2 = imagesc(squeeze( mean(multidata,1) ));
set(gca,'clim',[-1 1]*2), axis square
title('Smoothed data');


% loop through time points and update the displays
for ti=1:npnts
    
    % use set to update color data in the above images
    set(imgh1,'CData',squeeze(multidata(ti,:,:)))
    set(imgh2,'CData',squeeze(multidataS(ti,:,:)))
    
    pause(.05)
end

%%
