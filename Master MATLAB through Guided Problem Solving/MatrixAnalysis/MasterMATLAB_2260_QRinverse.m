%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Matrix inverse via QR decomposition
% Instructor: mikexcohen.com
%
%%

% create the matrix
m = 4;
M = round(10*randn(m));


% the QR method
[Q,R]  = 


% the direct explicit inverse method
Min_in = 


% image the matrices
figure(1), clf

% original matrix
subplot(131)
set(gca,'xtick',[],'ytick',[])
title('M')

% inverse from QR
subplot(232)
set(gca,'xtick',[],'ytick',[])
title('M^{-1} from QR')

% matrix times its inverse should be identity matrix
subplot(233)
set(gca,'xtick',[],'ytick',[])
title('M*M^{-1} = I')


% inverse from inv function
subplot(235)
set(gca,'xtick',[],'ytick',[])
title('M^{-1} from inv()')

% matrix times its inverse should be identity
subplot(236)
set(gca,'xtick',[],'ytick',[])
title('M*M^{-1} = I')


%%
