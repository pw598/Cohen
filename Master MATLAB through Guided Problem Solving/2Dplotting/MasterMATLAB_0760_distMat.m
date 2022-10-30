%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Distance matrix from generated points
% Instructor: mikexcohen.com
%
%%

% setup figure
figure(1), clf
h = plot(nan,nan,'rs','markersize',10,'markerfacecolor','k');
title('Press SPACE when finished!')
axis([ -1 1 -1 1 ])

% initialize data points
[x,y] = deal([]);

% enter while loop
toggle = true; % boolean toggle
while toggle
    
    % get one new input
    [xt,yt,button] = ginput(1);
    x = [x xt];
    y = [y yt];
    
    % update axis display
    set(h,'XData',x,'YData',y);
    
    % check if space key was pressed,
    % and switch off toggle if appropriate
    if strcmp(char(button),' ')
        toggle = false;
    end
end % end of while loop


%% distance matrix and plotting

% number of button presses
n = numel(x);

% all-to-all distances
distmat = zeros(n);
for i=1:n
    for j=1:n
        % Euclidean distance between dot i and dot j
        
    end
end

% compute the distance matrix in one line using bsxfun



% plot the data
figure(2), clf
subplot(221)
plot(x,y,'rs','markersize',10,'markerfacecolor','k')
axis square
title('All points')

% image the distance matrix
subplot(222)
imagesc(distmat)
axis square
title('distance matrix')

% plot a histogram
subplot(212)
hist( 
title('Histogram')


%%
