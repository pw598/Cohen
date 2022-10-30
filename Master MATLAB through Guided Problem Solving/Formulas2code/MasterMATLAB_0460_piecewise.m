%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Translate formulas into code
%      VIDEO: Piecewise functions
% Instructor: mikexcohen.com
%
%%

x = linspace(-10,20,1000);
y = zeros(size(x)); % initialize output


% the effective-but-unseemly way
for i=1:length(x)
    
    % piece 1
    if x(i)<-1
        y(i) = sin(2*pi*x(i)*4);
        
    % piece 2
    
        
    % piece 3
    
        
    % piece 4
    
        
    % piece 5
    
    end
end

figure(1), clf
plot(x,y,'r-^')

%% before the better solution, a primer on dsearchn

% question: which index contains the number 4?
t = [ 1 3 4 5 6 7 ];

% could solve with find
find(t==4)

% new question: which index is *closest* to 4.01?
find(t==4.01) % nope.

idx = dsearchn(t',4.01); % inputs must be column vectors
t(idx)

% same thing as min(abs
[~,idx] = min(abs(t-4.01));
t(idx)

%% now for the better way to make a piece-wise function

% find indices of break points
xidx = dsearchn(x',[-1 0 3 10]');

% piece 1
y(1:xidx(1)) = sin(2*pi*4* x(1:xidx(1)) );

% piece 2


% piece 3


% piece 4


% piece 5


hold on
plot(x,y,'ko-')

%%

