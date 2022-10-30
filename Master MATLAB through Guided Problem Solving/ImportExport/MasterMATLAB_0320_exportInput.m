%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Importing and exporting data
%      VIDEO: Export and import multiple files
% Instructor: mikexcohen.com
%
%%


basefilename = 'testfile';
numfiles = 10;

% loop over all files
for filei = 
    
    % create string with name of file
    filename = 
    
    % skip this iteration of the loop if the file exists
    
    % generate some random data
    randomdata = randn(100);
    
    % write to output file (MATLAB .mat format)
    
end
    
%% an aside on the continue function

for i=1:10
    
    % skip this iteration if i is even
    if mod(i,2)==0, continue, end
    
    % print the number
    disp([ 'Iteration ' num2str(i) ])
end

%% now for importing data

% use wild-card (*) to find the files to import
files2import = 

% initialize as cell array
alldataC = 

% loop over file names
for filei=1:
    
    % import and store data
    
    
    
    % for matrix storage, initialize on first iteration
    
    % and now populate the big matrix
    alldataM(filei,:,:) = randomdata;
    
end

%%

