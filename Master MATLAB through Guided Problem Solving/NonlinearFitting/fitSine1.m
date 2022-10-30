function [sse,outparams] = fitSine(params,x)

%% setup sine wave
a = params(1); % amplitude
f = params(2); % frequency (normalized)
p = params(3); % phase (x-axis offset)
t = (0:length(x)-1)/length(x);

% predicted value
predY = a * sin( f*t + p );

% predictors and sse (minimization objective)
outparams = [ a f p ];
sse = sum( (predY-x).^2 ) / sum( x.^2 );

% optional plotting
plot(t,x,'ro',t,predY,'k-'); drawnow; pause(.01)

%%
