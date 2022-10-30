%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Descriptive statistics
%      VIDEO: Compute measures of central tendency
% Instructor: mikexcohen.com
%
%%

% dataset to work with
data = round( exp(2+randn(101,1)/2) );

% always important to look at data!
figure(1), clf
histogram(data,20)

%% compute the mean

% algorithm here
n = 
themean = 

% compare with MATLAB's mean function
themean2 = 

%% compute the median

% sort the data points
datasort = 

% find the middle value
themedian = 

% compare with built-in function
themedian2 = 

%% compute the mode

% find the unique data values
uniquevals = 

% loop through values and count the number of numbers with each value
numnums = zeros(size(uniquevals));
for ui=1:length(numnums)
    % here is the counting
    numnums(ui) = 
end

% find the maximum count
[dontcare,maxidx] = 

% the mode is that value
themode = 

% compare with MATLAB function
themode2 = 

%% bonus

hold on


legend({'Data';'mean';'median';'mode'})
xlabel('Value'), ylabel('Count')

%%
