%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Fractal time series and images
%      VIDEO: Mandelbrot set
% Instructor: mikexcohen.com
%
%%

% parameters
n = 1000; % matrix size (probably not higher than 5k)
k =   40; % number of iterations

% define ranges of real and imaginary axes
re = 
im = 

% define matrices for computations
[X,Y] = meshgrid(,);
C     = ; % C is complex matrix
[Z,M] = deal( zeros( ) ); % initialize matrices


% loop over iterations
for i = 1:k
    
    % compute quadratic map
    Z = 
    
    % find elements exceeding |Z|>2 at this iteration
    % and set those elements in M to be the iteration #
    M(abs(Z)>2)
end

% show the quadratic map matrices
figure(1), clf
subplot(131), imagesc(re,im,Z)
axis square, title('Real part')

subplot(132), imagesc(re,im,Z)
axis square, title('Imaginary part')

subplot(133), imagesc(re,im,Z)
axis square, title('Magnitude')

% show the M matrix
figure(2), clf
imagesc(re,im,M)
xlabel('Real'), ylabel('Imag')
axis square
set(gca,'clim',[0 k])

%%
