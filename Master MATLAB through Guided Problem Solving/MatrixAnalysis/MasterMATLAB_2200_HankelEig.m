%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Matrix analysis
%      VIDEO: Eigenvectors of a Hankel matrix
% Instructor: mikexcohen.com
%
%%

m = 40;

% vector of random numbers
v = randn(m,1);

% hankel by function
hmat = hankel

% eigendecomposition
[V,D] = eig

% sort V and D according to descending eigenvalues
[evals,sidx] = 
V = 


% plot eigenvalues
figure(1), clf
subplot(141)
plot(,'s-','markerfacecolor','k','linew',2)
ylabel('\lambda'), xlabel('Order')
title('\lambda spectrum')

% image the eigenvectors
subplot(1,4,2:4)
title('\lambda-sorted eigenvectors')


% show a few example eigenvectors
figure(2), clf
subplot(211)
plot(,'linew',3)
title('A few eigenvectors for inspection...')



% compute frequency as cycles/row
cycPerRow = zeros(size(v));
for ci=1:m
    
    % count local maxima on this column
    peeks = 
    
    % we care about the number, not the values
    cycPerRow(ci) = 
end

% show the spectrum
subplot(212)
plot(,,'ks-','linew',2,'markerfacecolor','r','markersize',10)
title('Frequency spectrum')
xlabel('Components, sorted by \lambda magnitude')
ylabel('Frequency (a.u.)')


% finally, re-sort the eigenvectors according to cycle count
[~,sidx] = 

% image the new shuffled matrix
figure(3), clf
title('Frequency-sorted eigenvectors')

%%
