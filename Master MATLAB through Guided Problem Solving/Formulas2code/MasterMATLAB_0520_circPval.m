%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Translate formulas into code
%      VIDEO: Circular p-value and its approximation
% Instructor: mikexcohen.com
%
%%


% define n and z variables
n = 
z = 

% initialize
[pfull,papprox] = deal( 

for ni=1:length(n)
    for zi=1:length(z)
        
        pfull(ni,zi) = 
        papprox(ni,zi) = 
    end
end

% bonus: plot the maps and their difference
figure(1), clf
subplot(131)
contourf(,,,40,'linecolor','none')
axis square, set(gca,'clim',[0 1])
xlabel('Z'), ylabel('N')
colorbar
title('Full formula')


subplot(132)

title('Approximation')


subplot(133)

title('Difference')

%%
