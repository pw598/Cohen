%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Visualize the quadratic form of a 2x2 matrix
% Instructor: mikexcohen.com
%
%%

% create a little matrix
A = [2 1; 1 3];
% A = [2 1; 4 2];
% A = [2 1; 1 -1];

% weights along each dimension
xi = -2:.1:2;

% initialize the function output
quadform = 

% loop over the components of x
for i=1:length(xi)
    for j=1:length(xi)
        
        % define the weights for this iteration
        
        
        % compute the quadratic form of matrix A
        quadform(i,j) = 
        
    end
end

% create a surface of the function
figure(1), clf
title('Quadratic form of 2x2 matrix')
xlabel('W1'), ylabel('W2'), zlabel('energy')
rotate3d on, axis square

%%
