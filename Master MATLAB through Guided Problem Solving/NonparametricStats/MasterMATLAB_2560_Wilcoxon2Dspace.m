%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: 2D space of Wilcoxon effect sizes
% Instructor: mikexcohen.com
%
%%

% parameter ranges
meandiff = 
stddiff  = 
nTrials  = 100;

% initialize results matrix
zresults = zeros

% lots of loops!
for meani = 1:length(meandiff)
    for stdi = 1:length(stddiff)
        
        for triali=1:nTrials
            
            % create datasets
            data1 = 
            data2 = exp( 5+randn(N,1)*.5 );
            
            % z-test
            [~,~,s] = 
            
            % collect the results
            zresults(meani,stdi) = 
        end
    end
end

% divide by N for average



% show the results!
figure(1), clf
contourf(,,,40,'linecolor','none')
xlabel('Standard deviation')
ylabel('Mean difference')
set(gca,'clim',[0 5]), axis square
colorbar
title([ 'Z effect size for ' num2str(nTrials) ' iterations' ])

%%
