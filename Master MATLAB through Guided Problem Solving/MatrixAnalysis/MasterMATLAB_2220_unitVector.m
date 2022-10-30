%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Compute a unit vector in some direction
% Instructor: mikexcohen.com
%
%%

% any 2x1 vector
v = 

% compute the magnitude of the vector
vlength = 

% new unit vector is original scaled by its length
unitv = 

% confirm length=1
norm(unitv)


% plot both vectors
figure(1), clf, hold on
plot(,,'k','linew',2)
plot(,,'r','linew',5)
grid on, axis square
axis([-1 1 -1 1]*vlength)
legend({'v';'v^*'})

%%
