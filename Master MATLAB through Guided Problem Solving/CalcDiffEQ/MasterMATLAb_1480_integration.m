%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Calculus and differential equations
%      VIDEO: Function integration
% Instructor: mikexcohen.com
%
%%

% test in a simple example: x^4
syms x
f = x^4;
intf = int(f);

% plot the function and its integral
figure(1), clf, hold on
fplot
fplot
legend


% sanity check: integral of e^x


%% partial integration

syms x y
fxy = x^2 * y^3;

% compute integral with respect to x
int

% compute integral with respect to y
int


% what is the value of the partial integral with respect to x 
% at x=4 and y=-2.3?
subs
vpa

% double-check the above answer by computing it "manually"



%% a more difficult problem

% a very strange and very difficult function
f = 

% let's see what it looks like
figure(2), clf, hold on
fplot(f,[-20 10],'linew',3)


% now compute its integral
intf = 

% we'll have to compute the integral numerically
intvec = linspace(-20,10,100); % over this interval
intf2  = zeros(size(intvec));  % initialize

% to do this, we need to implement the mathematical function as an anonymous function
funcf = @(x) 

% loop over time points and compute the integral up to that time point
for i=1:length(intvec)
    intf2(i) = 
end

% and plot on top
plot(intvec,real(intf2),'linew',3)

%%
