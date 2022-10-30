%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Find, min, and max
%      VIDEO: Find signal clipping points
% Instructor: mikexcohen.com
%
%%

% time vector
t = linspace(0,4*pi,10000);

% create signal


% plot the signal
figure(1), clf
plot(t,s,'ks-','linew',2)
set(gca,'xlim',t([1 end]),'ylim',[-.05 1.05])
xlabel('Time (rad.)')

% find the flat/curved transitions in the signal
% (hint: try 1st and 2nd derivatives
%        then try change from the modal value)
sd2 = 

% plot the difference signal
hold on
plot(t(1:end-1),abs(sd2),'r^-','markerfacecolor','r')


% The right solution still isn't exactly correct; it needs to be adjusted
changeidx = find(sd2);


% finally, plot circles where the signal saturates
plot(t(changeidx),s(changeidx),'ro','linew',2,'markersize',10,'markerfacecolor','y')

%%
