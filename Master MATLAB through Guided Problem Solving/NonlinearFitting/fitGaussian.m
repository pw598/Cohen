function [sse,outparams] = fitGaussian(params,x,y)

%% setup the Gaussian

peak = params(1); % amplitude of the gaussian at its peak
fwhm = params(2); % width of the gaussian (aka standard deviation)
cent = params(3); % x-axis location of the peak

predY = peak*exp( -(x-cent).^2 / (2*fwhm^2) );

sse = sum( (predY-y).^2 ) / sum(y.^2);
outparams = [ peak fwhm cent ];

% optional plotting here...
plot(x,y,'o', x,predY,'-','markersize',12,'linew',3); drawnow;

