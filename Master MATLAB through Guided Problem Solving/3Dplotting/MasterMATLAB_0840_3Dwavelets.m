%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: 3D plotting
%      VIDEO: Expanding wavelets
% Instructor: mikexcohen.com
%
%%

% how many frequencies
n = 50;

% define wavelet parameters
frex = linspace(1,8,n); % frequency spread
time = -2:.001:2; % time vector

% initialize wavelet matrix
wave = zeros(n,length(time));

% loop over frequencies
for fi
    
    % 's' width parameter for Gaussian
    s = 
    
    % create the wavelet for this frequency
    wave(fi,:) = 
end

figure(2), clf

% make a surface plot

shading interp
rotate3d on, axis square
xlabel('Time (sec.)'), ylabel('Frequency (Hz)'), zlabel('Amplitude')

%%
