%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Command statements
%      VIDEO: Hilbert matrix using for-loops
% Instructor: mikexcohen.com
%
%%

% list dimensions
m = 5;

% initialize variables whenever possible!
hilmat   = 
checkmat = 

% now for the loops:
for i=1:m
    for j=1:m
        
        % denominator
        
        
        % and invert to find this element
        
        
        % bonus: checkerboard
        
        
    end
end

% let's see what they look like
figure(1), clf

subplot(121)
imagesc(hilmat)
axis square, title('Hilbert matrix')
set(gca,'xtick',[],'ytick',[])

subplot(122)
imagesc(checkmat)
axis square, title('Checkerboard matrix')
set(gca,'xtick',[],'ytick',[])

%%
