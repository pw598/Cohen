%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Orthogonalize a pair of vectors
% Instructor: mikexcohen.com
%
%%

% vector w, to be decomposed
w = [ 2 3 ]

% vector v, the reference
v = [ 4 1 ]

% compute parallel component first
beta =   % the projection scalar
w_par_v =      % scaled vector v

% then compute orthogonal component
w_perp_v =  - ;


% and make a nice plot
figure(1), clf
plot([],[],'r','linew',5) % original w
hold on
plot([],[],'b','linew',5) % original v

% now components
plot([],[],'r--','linew',3) % w||v
plot([],[],'r:','linew',3)  % w-perp-v


legend({'w';'v';'w_{||v}';'w_{\perp v}'})
axis([-1 1 -1 1]*max([norm(w) norm(v)]))
plot(get(gca,'xlim'),[0 0],'k--','HandleVisibility','off')
plot([0 0],get(gca,'xlim'),'k--','HandleVisibility','off')
axis square
grid on

%%
