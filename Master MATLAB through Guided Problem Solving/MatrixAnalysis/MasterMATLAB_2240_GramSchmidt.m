%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Gram-Schmidt algorithm
% Instructor: mikexcohen.com
%
%%

% create matrix
m = 7;
n = 4;

% random integers matrix
mat = round( 10*randn(m,n) );


% don't overwrite original matrix
GS = mat;

% first, normalize column 1
GS(:,1) = 

% loop through columns
for ci=2:n
    
    % initialize orthogonalized vector
    orthv = mat(:,ci);
    
    % subtract all previous dependent components
    for cj=1:ci-1
        
        % magnitude of projection ( v'w/w'w )
        projmag = 
        orthv   = 
    end
    
    % new column is normalized projection
    GS(:,ci) = 
end


% show that all columns are orthogonal
% compute the dot product between any two columns


% or show that its an orthogonal matrix via multiplication


% note: if n>m, then only the first m columns are valid.

%% the better way!

% more stable method: QR decomposition
[Q,R] = 

% keep only r rows
GS2 = 


% show that all columns are orthogonal
% via matrix multiplication



%%
