%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: Permutation testing
% Instructor: mikexcohen.com
%
%%

% two log-norm datasets
N1 = 40;
N2 = 60;
data1 = exp( 5.3 + randn(N1,1)*.5 );
data2 = exp( 5.0 + randn(N2,1)*.5 );

% plot the distributions
figure(1), clf

set(gca,'xlim',[.5 2.5],'xtick',[1 2],'xticklabel',{'data 1';'data 2'})

%% permutation testing

% combine both datasets into one variable
alldata = [ ];

% define a vector of condition mapping
mapping = [ ];

% numerator of the t-test: difference of means
tnum = 

% denominator of t-test: square root of variances divided by N
tden = 

% observed t-value is the ratio
obs_t = 

% number of permutations
npermutes = 1000;

% initialize permuted vector (and meta-permutation for the bonus)
perm_t = 
meta_t = 

% loop over iterations for permutation
for permi=1:npermutes
    
    % randomize the condition mapping
    fake_mapping = 
    
    % new t-value from permuted data
    tnum = 
    tden = 
    
    % permutation t-test for this iteration
    perm_t(permi) = 
end


% make a histogram of the permutation t-values
figure(2), clf
histogram(perm_t,50);

% plot the observed t-value on top as a line
hold on
plot(,,'r--','linew',3)

% z-value is the normalized distance of the observed t-value from the
% permutation distribution
zstat = 

title('Empirical H_0 distribution')
legend({'H_0';[ 'Zscore = ' num2str(zstat) ]})
set(gca,'xlim',[-1 1]*5)


%%
