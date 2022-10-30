%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Data animations
%      VIDEO: Smooth floating ball
% Instructor: mikexcohen.com
%
%%

figure(1), clf

% initial ball location
loc = [50 50];

% plot ball (with handle for faster updating)
ploth = 

% set axis properties so it looks a bit nicer
set(gca,'xlim',[0 100],'ylim',[0 100],'xtick',[],'ytick',[])
title('Press Ctrl-c to quit.')

% plot boundary
hold on
plot([],[],'k:')

% now begin!
while 1
    
    % random walk
    timenow = rem(now,1)*50000;
    loc(1)  = 
    loc(2)  = 
    
    % bounce off the walls
    
    
    
    % bonus: change color in danger zone
    if 
       
    else
       
    end
    
    % update XY coordinates
    set(ploth,'XData',loc(1),'YData',loc(2))
    pause(.05)
end


%%
