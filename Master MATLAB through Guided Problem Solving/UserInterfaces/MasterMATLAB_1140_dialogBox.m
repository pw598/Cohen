%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Graphical user interfaces
%      VIDEO: Dialog box for user input
% Instructor: mikexcohen.com
%
%%

% ask user to input the (1) size of a matrix, (2) title of figure, (3) output filename
questions = { 'Enter matrix size as <rows>X<columns> or <rows>,<columns>'; ...
              'Title of the figure'; 'Output filename' };


answers = inputdlg

% decode the first input (matrix size)
xloc = 
matsize = 

% make figure
figure(1), clf
imagesc( randn(matsize) )
title(answers{2})

print


%%
