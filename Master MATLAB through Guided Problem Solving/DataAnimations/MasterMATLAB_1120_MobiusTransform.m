%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Data animations
%      VIDEO: Moebius transformation
% Instructor: mikexcohen.com
%
%%

% lim is the limits of the plots
lim = 40;

% define real part, imaginary part
a = linspace(,,80);
b = linspace(,,75);

% initialize the function
mobtrans = zeros

% list the possible range of t-parameters
ts = linspace(,,90);




% setup the figure with handles for later adjustments
figure(1), clf

clim = [-1 1]*50;
imgh = [0 0 0];
plotlabs = { 'mag';'real';'imag' };
for i=1:3
    subplot(1,3,i)
    imgh(i) = imagesc(,,);
    axis square, set(gca,'clim')
    xlabel('Real'), ylabel('Imag')
end


% compute the function
for ti=1:length(ts)
    
    % set t for this iteration
    t = 
    
    % double-loop over real and imaginary components
    for i=1:length(a)
        for j=1:
            
            % complex number for this pair
            z = 
            
            % separate the formula into numerator and denominator
            num = 
            den = 
            
            % function is their ratio
            mobtrans(i,j) = 
        end
    end
    
    % bonus: without the double-loop!
    
    
    % update the color data in the plots
    
    
    pause(.1)
end

%%
