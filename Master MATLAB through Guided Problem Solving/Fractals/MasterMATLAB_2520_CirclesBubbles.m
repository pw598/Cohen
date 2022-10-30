%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Fractal time series and images
%      VIDEO: Fractal circles and bubbles
% Instructor: mikexcohen.com
%
%%

% number of circles
N = 100;

% define radii as 1/f from 10 to 1
radii = 

% random circle centers
cent  = 

% define theta (angles) for circle perimeters
theta = linspace(,,50);


% plot the circles
figure(1), clf
subplot(1,4,1:3), hold on
for ci=1:N
    
    % generate x and y points for the circle
    cx =  radii(ci)*cos(theta);
    cy = 
    
    % and plot
    plot(cx,cy,'linew',3)
end

% adjust axis properties
axis tight
set(gca,'xtick',[],'ytick',[])

% show a histogram of radii
subplot(144)

xlabel('Radius'), ylabel('Number of circles')
set(gca,'xlim',[.5 N/10+1])

%% same thing but with spheres

% generate sphere vertices
[X,Y,Z] = sphere(10);


% random circle centers
cent = 50*rand


figure(2), clf, hold on
for si=1:N
    
    % define adjusted XYZ coordinates
    Xx = radii(si)*X - 
    Yy = 
    Zz = 
    
    % make a surface of this ball
    surf(Xx,Yy,Zz)
    
    % bonus: set ball color by radius
    
end

% make the axes look a bit nicer
axis square
rotate3d on
set(gca,'xtick',[],'ytick',[],'ztick',[])

%%
