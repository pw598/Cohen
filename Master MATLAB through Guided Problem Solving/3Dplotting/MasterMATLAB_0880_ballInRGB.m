%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: Carve a ball in 3D color (RGB) space
% Instructor: mikexcohen.com
%
%%

% target center and radius of the sphere
skip   = 4;
cent   = round([ .3 .0 .8 ]*255/skip);
radius = round( .3 *255/skip);


% define the indices in the RGB space
x = 0:255/skip;
[R,G,B] = meshgrid(


% show those points as a physical sphere with color mapped on
distSph = % Euclidean distance
distSph = distSph<radius;

% convert the subscripts into indices
[i,j,k] = ind2sub(size(distSph),find(distSph(:)));

figure(1), clf
scatter3(i,j,k,30,[i j k]./(255/skip),'filled')
axis square, rotate3d on
set(gca,'xlim',[0 255]/skip,'ylim',[0 255]/skip,'zlim',[0 255]/skip)
xlabel('Red'), ylabel('Green'), zlabel('Blue')

% convert the axis labels to fraction of maximum color


%%
