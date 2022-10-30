%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Segmentation
%      VIDEO: Threshold-based time series segmentation
% Instructor: mikexcohen.com
%
%%

% generate a smooth time series
N  = 5000; % points
tv = (0:N-1)/(N/10); % time vector
ts = 

patchcolor = 'rg';
whichsign  = '<>';

% draw the time series and y=0 line
figure(1), clf, hold on
plot(
plot(get(gca,'xlim'),


% find threshold of 10% on both tails of the distribution
tmpsort   = sort( ts );
thresh(1) = 
thresh(2) = 


% loop over the two thresholds
for threshi=1:2
    
    % find all regions exceeding threshold
    eval([ 'beyondthresh = ts' 
    
    % get islands
    islands     = 
    
    % bonus: remove any islands with fewer than 5 points
    islands.num = 
    
    
    
    % loop through and draw patches to 0
    for i=1:islands.NumObjects
        
        % find xy points
        xpnts = 
        ypnts = 
        
        % draw the patch
        patch([  ],[  ],patchcolor(threshi),'facealpha',.5,'linestyle','none');
    end
    
end


%%
