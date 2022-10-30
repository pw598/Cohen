%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: MxM matrix with rank M-1
% Instructor: mikexcohen.com
%
%%

% size of matrix
m = 14;

% rank test
rank( randn(m,m) )

% one solution: generate an M x (M-1) and fill in the final column
matr = 
% its rank should be m-1, although it's not the right size per instructions


% one easy method
matr(:,m) = 

% success:
rank
size

%% bonus

% random linear combination
lincombo = randn

% recreate random matrix
matr = randn(m,m-1);

% sum to get final column
matr(:,m) = 

% check size and rank
size(matr)
rank(matr)

%%
