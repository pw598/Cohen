%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Hermitian vs. regular transpose
% Instructor: mikexcohen.com
%
%%

% two vectors, one complex
v1 = [  ];
v2 = [  ];

% show that ' is the Hermitian transpose



% what does .' do?



% or use function transpose
transpose


%% same story for matrices

A = complex( randn(2,3),randn(2,3) );

% Hermitian transpose


% regular transpose


%% brief aside: why do we need the Hermitian transpose?

% create a complex vector
w = [ 0 1i ];

% plot it as a line in the complex plane
figure(1), clf
plot([],[],'r','linew',3)
grid on
axis([-1 1 -1 1]*norm(w)*1.1)
xlabel('Real axis'), ylabel('Imaginary axis')

% clearly this vector has length=1... or does it??
wlength = 

% length cannot be -1, so use Hermitian transpose instead
wlength = 


%%
