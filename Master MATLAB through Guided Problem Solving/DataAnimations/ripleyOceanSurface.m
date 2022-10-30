

figure(1), clf

% create an empty surface
surfh = surf(zeros(500));

% make it look a bit nicer
shading interp
axis off
rotate3d on
set(gca,'zlim',[-3 10])

% create 2D Gaussian
[X,Y] = meshgrid(linspace(-2,2,500));
gaus2d = exp( -(X.^2+Y.^2) / .001 );

% create own colormar

% create data
for i=1:150
    a = rand(size(X));
    complexdata = (a+rand(size(X))) .* exp(1i*rand(size(X))*2*pi);
    landscape = real(ifft2(fftshift(gaus2d).*complexdata));
    landscape = landscape./max(landscape(:));
    
    % draw the data in the axis
    if i==1, set(surfh,'CData',landscape); end
    set(surfh,'ZData',landscape);
    pause(.1)
end



















