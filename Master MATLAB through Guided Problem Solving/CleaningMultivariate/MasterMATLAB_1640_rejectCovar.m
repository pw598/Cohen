%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning multivariate time series
%      VIDEO: Reject data based on extreme covariance
% Instructor: mikexcohen.com
%
%%

load multivar_data.mat
datadims = size(data);

% compute average of single-trial covariances
covave = zeros(
for triali=1:datadims(3)
    covave = 
end

% divide by number of trials
covave = covave / 



% now loop through trials and compute the distance to the average
covdist = zeros(datadims(3),1);

for triali=1:datadims(3)
    thistrialcov = cov( 
    covdist(triali) = sqrt( 
end

% convert to z
covdistz = (covdist-) / std();

% show the covariance distances
figure(1), clf
subplot(1,3,1:2)
plot(covdistz,'ks-','linew',2,'markerfacecolor','w','markersize',12)
xlabel('Trial')
ylabel('Z-scored covariance distances')

subplot(133)
histogram(covdistz,10)


% pick a threshold
thresh = 

% identify trials that exceed the threshold
toofar = 

% remove those trials from the data
data2 = data;
data2(:,:,toofar) = 

% check sizes

% plot a trial-average time course from an example channel
figure(2), clf, hold on
plot(1:datadims(2),mean(data(31,:,:),3),'k','linew',2)


% make the plot look a bit nicer
xlabel('Time (a.u.)')
set(gca,'xlim',[
legend({'Original data';'Trials removed'})
zoom on

%%
