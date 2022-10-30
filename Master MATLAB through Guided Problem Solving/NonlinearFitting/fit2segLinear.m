function [sse,p] = fit2segLinear(bpoint,x,y)

% make sure that x and y are column vectors
x = x(:);
y = y(:);

% make sure that x and y are sorted according to x
[x,idx] = sort(x);
y = y(idx);

bpoint = round(bpoint);

%% fit two linear models to the data

% first piece
x1 = [ones(bpoint,1) x(1:bpoint)];
y1 = y(1:bpoint);
b1 = (x1'*x1) \ (x1'*y1);

% second piece
x2 = [ones(length(x)-bpoint,1) x(bpoint+1:end)];
y2 = y(bpoint+1:end);
b2 = (x2'*x2) \ (x2'*y2);

%%

yHat = [ b1(1)+b1(2)*x(1:bpoint); b2(1)+b2(2)*x(bpoint+1:end) ];

% compute the model fit to the data
sse = sum((yHat-y).^2) / sum(y.^2);

p = [ b1' b2' x(bpoint) sse ];

%% plotting

plot(x,y,'ro',...
     x(1:bpoint),yHat(1:bpoint),'k',...
     x(bpoint+1:end),yHat(bpoint+1:end),'k')
drawnow;

%%

