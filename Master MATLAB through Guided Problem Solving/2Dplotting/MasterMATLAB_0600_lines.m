%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Lines
% Instructor: mikexcohen.com
%
%%

%% very brief intro to plotting lines

% start with a clean figure
figure(1), clf

% note: MATLAB draws down the columns;
%    this code produces 4 10-point lines
plot(randn(10,4))

hold on
plot(get(gca,'xlim'),[0 0],'k','linewidth',3)

%% curve from straight lines

% number of lines (resolution)
n = 10;

% clear figure and hold on
figure(2), clf
hold on

% loop over lines
for i=1:n
    
    
end

% give the plot that 1980's video game look
set(gcf,'color','k')
axis off

%%
