function [sse,r] = fitOval(r,xy)

%% generate the circle

th = linspace(0,2*pi,length(xy));

x = xy(1,:);
y = xy(2,:);

% predicted circle
xx = r(1)*cos(th+r(3));
yy = r(2)*sin(th+r(4));

ssex = sum( (xx-x).^2 ) / sum(x.^2);
ssey = sum( (yy-y).^2 ) / sum(y.^2);
sse = (ssex+ssey)/2;

% optional plotting
plot(x,y,'ro', xx,yy,'k','linew',2)
drawnow;

