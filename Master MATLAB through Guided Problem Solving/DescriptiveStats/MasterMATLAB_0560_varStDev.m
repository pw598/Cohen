%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Descriptive statistics
%      VIDEO: Compute variance and standard deviation
% Instructor: mikexcohen.com
%
%%

% dataset to work with
data = exp(2+randn(101,1)/2);

% always important to look at data!
figure(1), clf
histogram(data,20)

%% compute the variance

thevar = 0;
for i=1:length(data)
    thevar = 
end

thevar = 

% compare with MATLAB's implementation
thevar2 = 

%% compute standard deviation

% bonus: do it without subtracting the mean inside the for-loop

% compute variance
thestd = 0;
for i=1:length(data)
    thestd = 
end

thestd = 

% compare with MATLAB's implementation
thestd2 = 


%%
