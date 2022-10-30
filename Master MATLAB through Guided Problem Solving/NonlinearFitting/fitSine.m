function [sse,outparams] = fitSine(params,x)

%% build our sine wave based on the input parameters

a = params(1);
f = params(2);
p = params(3);

outparams = [ a f p ];

% time vector
t = (0:length(x)-1)/length(x);

% predicted data
predY = a*sin(t*f + p);

% fit of the model to the data
sse = sum((predY-x).^2) / sum(x.^2);

% plot
% plot(t,x,'ro', t,predY,'k'); 
% set(gca,'ylim',[-1.1 1.1]*max(abs(x)))
% drawnow;


