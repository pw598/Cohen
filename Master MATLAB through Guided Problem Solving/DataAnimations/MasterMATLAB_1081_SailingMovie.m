%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Data animations
%      VIDEO: Smooth sailing: The movie
% Instructor: mikexcohen.com
%
%%


% number of frames in movie (note: 30 fps)
nFrames = ;


% create an empty surface
figure(1), clf
surfh = surf(zeros(500));

% make it look a bit nicer
shading interp
axis off
rotate3d on
set(gca,'zlim',[-1 3])

% create 2D Gaussian
[X,Y] = meshgrid(linspace(-2,2,500));
gaus2d = exp( -(X.^2+Y.^2) / .001 );

% generate landscape height (based on 2D FFT)
a = rand(size(X));
complexdata = (a+rand(size(X))) .* exp(1i*rand(size(X))*2*pi);
landscape = real(ifft2(fftshift(gaus2d).*complexdata));
landscape = landscape./max(landscape(:));
set(surfh,'ZData',landscape);




% setup movie



% phases for traveling waves
theta = linspace( , ,nFrames);

% create data
for i=1:nFrames
    
    landscape = sin(2*pi*X + theta );
    
    % draw the data in the axis
    set(surfh
    
    % update movie frame
    
    
    pause(.01)
end


% write out movie


%%
