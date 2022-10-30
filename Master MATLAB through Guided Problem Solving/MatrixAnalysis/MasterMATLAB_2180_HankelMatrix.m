%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Create a random Hankel matrix
% Instructor: mikexcohen.com
%
%%

% length of vector (and size of hankel)
m = 4;

% vector of random numbers
v = randn(m,1);

% hankel by function
hmat = 

% hankel by loop
hmat2 = zeros(numel(v));
for i=1:m
    hmat2(i,:) = 
end

% bonus: create the hankel matrix element-wise


% show the vector and matrix
figure(1), clf
subplot(151)

set(gca,'xtick',[],'ytick',[])
title('v')


subplot(1,5,2:5)

set(gca,'xtick',[],'ytick',[])
title('hankel(v)')


%%
