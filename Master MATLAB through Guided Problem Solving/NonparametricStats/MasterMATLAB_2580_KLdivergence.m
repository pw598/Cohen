%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: KL divergence of two distributions
% Instructor: mikexcohen.com
%
%%

% number of data points per distribution
N = 10000;

% generate first distribution
data1 = exp( randn(N,1)*.5 );
% z-normalize the distribution
data1 = 

% same for second distribution
data2 = randn(N,1);


% need bin edges to be the same
edges = linspace(min(),max(),80);

% find histogram bin counts for the two distributions
y1 = histcounts(
y2 = histcounts(

% convert to probability density
y1 = 
y2 = 


% average edge bins to facilitate plotting and coding
edges = ;

% plot the histograms and line plots
figure(1), clf
plot(edges,y1, edges,y2,'linew',2)
xlabel('Value'), ylabel('Probability')
legend({'Data 1';'Data 2'})


% now compute the KL divergence
tmpkl = 
kldist = 

title([ 'KL distance = ' num2str(kldist) ])

%%
