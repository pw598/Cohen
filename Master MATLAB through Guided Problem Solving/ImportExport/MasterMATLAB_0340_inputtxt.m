%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Importing and exporting data
%      VIDEO: Import formatted text file
% Instructor: mikexcohen.com
%
%%

% pointer to the file
fid = fopen('datafile.txt');

%% read header

% ignore first line
IgnoreFirstLine = fgetl

% second line contains number of sensors
hdr_nSensors = 
nSensors = 

% third line contains number of time points
hdr_ntimepoints = 
nPnts = 

% move pointer ahead until "Start data"
toggle = true;
while toggle==
    
    % get a line of data
    aline = 
    
    % test whether the line begins with "Start", and flip toggle
    if strcmpi
        
    end
end

%% read data

% initialize matrix
data = 

% set toggle and begin while loop
toggle = true;
while toggle
    
    % get a line of tab-delimited data
    aline = 
    
    % check whether we're at the end of the data
    if strcmpi
        
    end
    
    % put the data point into the matrix at the appropriate position
    data(  ,  ) = 
    
end

% now we can plot the data
figure(1), clf
plot(data','linew',2)

%%
