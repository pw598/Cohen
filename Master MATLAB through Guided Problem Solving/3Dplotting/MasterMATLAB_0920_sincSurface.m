%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: Complex sinc surface
% Instructor: mikexcohen.com
%
%%

% define real and imaginary parts
x = 
y = 

% initialize surface
sincsurf = zeros(length(x),length(y));

% implement the formula in a loop
for i=1:length(x)
    for j=1:length(y)
        
        % complex number from x (real) and y (imag)
        z = 
        
        % compute the surface value at this point
        sincsurf
    end
end

% without the loop!


% now show the surface
figure(1), clf
surf(y,x,
shading interp, rotate3d on
xlabel('Real'), ylabel('Imag'), zlabel('f(z)')
axis square

%%
