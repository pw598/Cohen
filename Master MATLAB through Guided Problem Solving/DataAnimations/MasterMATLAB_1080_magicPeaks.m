%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Data animations
%      VIDEO: The magically materializing peaks
% Instructor: mikexcohen.com
%
%%

figure(1), clf

% get peaks
n = 49;
[X,Y,Z] = peaks(n);

% create the surface and fix the limits
h = surf(X,Y,Z);
set(gca,'xlim',[],'ylim',[],'zlim',[])
th = title('Random title here, doesn''t matter.');

% proportion of tiles to show
tiles2show = linspace(1,0,40);


% loop over proportion of tiles to show
for tilei=1:length(tiles2show)
    
    
    % loop again over random iterations
    for j=1:10
        
        % random selection of tiles
        idx = randsample

        % use the following lines if you don't have the stats toolbox
        %idx = randperm
        %idx() = [];
        
        % why is the following line not good?
        %idx = randi(n*n,ceil(tiles2show(tilei)*n^2),1);
        
        % "switch off" those tiles
        
        
        
        % update the graph
        set(h,'',z)
        pause(.05)
    end
    
    % bonus: update title to indicate proportion of patches shown
    
    
end

%%
