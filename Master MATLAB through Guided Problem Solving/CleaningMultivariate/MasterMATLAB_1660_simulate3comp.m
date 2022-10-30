%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Cleaning multivariate time series
%      VIDEO: Simulate tri-component time-space data
% Instructor: mikexcohen.com
%
%%


% create dataset
N = 50; % grid
[X,Y] = meshgrid(1:N);

% forward models of sine, Gaussian, and linear increase
formod_sin = 

% gaussian
w = 2*(N/pi)^2;
formod_gau = exp( -() / w);

% linear shift
formod_lin = Y./

figure(1), clf
subplot(231), imagesc(formod_sin), axis square
subplot(232), 
subplot(233), 
subplot(223), imagesc(


% independent amplitude modulator time courses
k = 10; % number of poles for random amplitudes
npnts = 200;
slowdrift1 = interp1(randn(k,1),,'pchip')';
slowdrift2 = 
slowdrift3 = 

% plot the amplitude modulators
figure(2), clf, hold on
plot(1:npnts,slowdrift1,'linew',2)
plot(1:npnts,slowdrift2,'linew',2)
plot(1:npnts,slowdrift3,'linew',2)


% loop over time and create the multivariate dataset
multidata = zeros([ npnts N N ]);
for ti=1:npnts
    multidata(ti,:,:) = ...
end

% show in a video in the previous figure
figure(3)
subplot(224)
% create an image handle to modify later
imgh = imagesc(
set(gca,'clim',[-1 1]*2)
axis square
% create handle to the title object
th = title('Movie.');

for ti=1:npnts
    set(imgh
    set(th
    pause(.05)
end

%%
