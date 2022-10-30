%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Find, min, and max
%      VIDEO: Find the point closest to specified value
% Instructor: mikexcohen.com
%
%%

%% if there is an exact match

% the list
list = 1:5;

% a boolean vector
whichAre3 = list == 3

% find the nonzero values
whereIs3 = find( whichAre3 )

% confirm
list(whereIs3)

%% if it's close but not exact

searchnum = 4;

list = logspace( log10(1),log10(10),58 );

% exact match? --> nope
find( list==searchnum )

% option 1 (run each line at a time and inspect graph)
figure(1), clf
subplot(211)
plot(list,'s-')
plot(list-searchnum,'s-')
plot(abs(list-searchnum),'s-')

% find the minimum!
[val,idx] = 
% reinterpretation: find closest Euclidean distance
[val,idx] = 

% alternative:
idx = dsearchn

% plot the desired value on the plot
hold on
plot(,,'ro','markersize',10,'markerfacecolor','r')

subplot(212)
plot(list,'s-')
hold on
plot(,,'ro','markersize',10,'markerfacecolor','r')
plot(get(gca,'xlim'),[1 1]*searchnum,'k--')
zoom on

%% finding matrix indices

% matrix sizes for reshaping the vector into a matrix
m = 5;
n = 10;

% reshape into a matrix
matr = reshape( list(1:m*n) ,[m n]);

% above solution won't work here...
idx = dsearchn

% try "vectorizing" the matrix
idx = dsearchn

% convert vector to matrix indices
[xi,yi] = 

% now we can see the value at that element
matr(xi,yi)

%%
