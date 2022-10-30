%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: 2D space of KL divergences
% Instructor: mikexcohen.com
%
%%

% parameter space definitions
N        = 10000; % points in distribution
meandiff = 
stddiff  = 
nTrials  = 20;

% initialize
kldist = 

% loop over parameter spaces
for meani=1:length(meandiff)
    for stdi=1:length(stddiff)
        
        for triali=1:nTrials
        
            data1 = 
            data2 = 
            
            % need bin edges to be the same
            edges = linspace(,,80);
            
            % use edges to obtain histogram counts per bin
            y1 = 
            y2 = 
            
            % convert to probability density
            y1 = 
            y2 = 
            
            % compute KL divergence
            tmpkl = 
            kldist(meani,stdi) = 
        
        end % end trial loop
    end % end std loop
end % end mean loop

% compute average KL divergence
kldist = 

% show an image of the KL divergence space
figure(1), clf

xlabel('Standard deviation')
ylabel('Mean offset')
colorbar

%%
