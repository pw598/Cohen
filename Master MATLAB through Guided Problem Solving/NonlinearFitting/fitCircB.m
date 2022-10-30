function [sse,params] = fitCircB(params,xy)

%% setup circle
theta = linspace(0,2*pi,length(xy));
x = xy(1,:);
y = xy(2,:);

% predicted circle
xx = params(1) * cos(theta + params(3));
yy = params(2) * sin(theta + params(3));

sse1 = sum( (xx-x).^2 ) / sum( x.^2 );
sse2 = sum( (yy-y).^2 ) / sum( y.^2 );
sse  = (sse1+sse2)/2;

% optional plotting
plot(x,y,'ro',xx,yy,'k-','linew',2); axis([-1 1 -1 1]*5), drawnow; pause(.01)

%%
