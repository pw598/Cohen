%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: MxN matrix with rank r via SVD
% Instructor: mikexcohen.com
%
%%

% matrix sizes
m = 15;
n = 11;

% desired rank
r = 6;

% matrix of random integers
mat = round( 10*randn(m,n) );

% SVD of matrix
[U,S,V] = 

% full reconstruction
matFull = 

% reconstruct using the first r components
matRedu = 


% make an image of the original matrix
figure(1), clf
clim = 
subplot(131)
set(gca,'xtick',[],'ytick',[],'clim',clim)
title([ 'Original, rank=' num2str(rank(mat)) ])

% the reduced matrix
subplot(132)
set(gca,'xtick',[],'ytick',[],'clim',clim)
title([ 'Reduced, rank=' num2str(rank(matRedu)) ])

% and difference of original and reduced
subplot(133)
set(gca,'xtick',[],'ytick',[],'clim',clim)
title('Difference of the two matrices')

%%
