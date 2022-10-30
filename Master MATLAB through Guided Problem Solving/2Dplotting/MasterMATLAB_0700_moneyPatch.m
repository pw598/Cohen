%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 2D plotting
%      VIDEO: Uncertainty in future money (using patch)
% Instructor: mikexcohen.com
%
%%

% first, some basics about defining a patch

figure(1), clf

% specify x and y coordinates
x = [ 1 2 2.5 4 3 2 ];
y = [ 1 2  3  3 1 1 ];

patch(x,y,'y')
hold on
plot(x,y,'ks','markersize',15,'markerfacecolor','k')

set(gca,'xlim',[min(x)-.5 max(x)+.5],'ylim',[min(y)-.5 max(y)+.5])

%% multiple patches drawn at the same time

% specify x and y coordinates
x = [ 1 2 2; 3 3 4 ];
y = [ 3 3 1; 1 3 3 ];

clf

patch(x,y,'y') % drawing patches down the columns
hold on
plot(x,y,'ks','markersize',15,'markerfacecolor','k')

%% show me the money!

% initialize three variables
% You could also use one matrix with all variables
[money,moneyP,moneyM] = deal( 100000 );

% loop over years, starting "next year" (i+1)
for i=1:9
    % apply formula in slides for different inflation amounts
    % note that 5% = .05
    money(i+1)  = 
    
end

% define x-axis labels as years, from system clock
year = clock;


% first, draw line plots
figure(2), clf, hold on

plot(xlabels,
plot(xlabels,
plot(xlabels,

% plot the patch
patch([],[],'g','facealpha',.3,'linestyle','none');
patch([],[],'r','facealpha',.3,'linestyle','none')

% helpful labels
xlabel('year'), ylabel([ 'Value in ' num2str(year) ' money (x10000)' ])
set(gca,'fontsize',15,'xlim',[xlabels(1)-1 xlabels(end)+1],'xtick',xlabels)
set(gca,'YTick',50000:10000:100000,'yticklabel',5:10)

legend({'3% inflation';'2% inflation';'1% inflation'})

%%
