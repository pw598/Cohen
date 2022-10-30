%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning univariate time series
%      VIDEO: Interpolate missing data
% Instructor: mikexcohen.com
%
%%

% number of data points
n = 10000;

% gaussian kernel for smoothing
g = exp( -linspace(-2,2,

% signal is smoothed noise
[origsig,signal] = deal( conv( 


% pick some random data points
propnoise = .02;

% find noise points
noisepnts = randperm(n);
noisepnts = 


% loop through time points and make random-length sequences to be NaN
for ti=1:length(noisepnts)
    
    % pick random-length sequences
    tidx = noisepnts(ti):noisepnts(ti)+ceil(rand*10);
    
    % set to NaN
    
end


% segment time series to find NaN streams, using bwconncomp 
% (note: in image-processing toolbox)
islands = 

% useful to know number of elements in each island
islands.N = cellfun(@

% loop over 'islands' and interpolate each one
filtsig = signal;
for ii=1:islands.NumObjects
    
    % find boundary points immediately surrounding NaN regions
    bndpoints = [ islands.PixelIdxList islands.PixelIdxList ];
    
    % skip if out of bounds
    if bndpoints(1)<1 || bndpoints(2)>n
        continue
    end
    
    % compute linear interpolation subsignal (y=mx+b)
    linterp = linspace(0,1,islands.N(ii)+2)* + ;
    
    % replace NaN data points with new interpolated values
    filtsig(islands.PixelIdxList{ii}(1)-1:islands.PixelIdxList{ii}(end)+1) = ;
end

% plot the three time courses (for bonus, vertically stack them!)
figure(1), clf

legend({'Original';'Measured';'Interpolated'})
zoom on


%%
