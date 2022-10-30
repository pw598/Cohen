%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Data animations
%      VIDEO: The square chases the mouse
% Instructor: mikexcohen.com
%
%%

figure(1), clf, hold on

% initial ball location
loc = [50 50];

% plot ball (with handle for faster updating)
ploth = 
targh = 

% set axis properties so it looks a bit nicer
set(gca,'xlim',[0 100],'ylim',[0 100],'xtick',[],'ytick',[])
title('Click on the window. Press Ctrl-c to quit.')

% now begin!
while 1
    
    % random walk
    mpos = round( get(gca,'CurrentPoint') );
    
    % update position to get closer to mouse click point
    loc(1) = loc(1)+
    loc(2) = loc(2)+
    
    % don't go off the screen
    
    
    
    % update XY coordinates
    set(ploth,'XData',loc(1),'YData',loc(2))
    set(targh,'XData',mpos(1),'YData',mpos(1,2))
    
    pause(.05)
end


%%
