%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Importing and exporting data
%      VIDEO: Convert US$ to Euros using up-to-date info
% Instructor: mikexcohen.com
%
%%

%%% NOTE ABOUT THIS CODE:
%  Transferwise recently changed security settings and no longer allows
%     remote queries to their converter.
%  Please use the free.currencyconverter api listed below. This will change
%     the search-string that you are searching for (look through the
%     variable htmldata), but you can still solve this challenge.

% read data from a website
% htmldata = urlread('https://transferwise.com/gb/currency-converter/usd-to-eur-rate?amount=1');
htmldata = urlread('http://free.currencyconverterapi.com/api/v5/convert?q=EUR_USD');

% the data is the entire html file;
% we need to find the right spot
startplace = strfind(htmldata,'"EUR_USD","val"');

% then convert the conversion factor into a number
us2euro = 

% now use that value to convert
numCurr = 50;
fprintf('US$%g = %g Euros; ',
fprintf('%g Euros = US$%g.\n',

%% note

% urlread cannot import from sites that have certain security features, e.g.:
urlread('https://www.udemy.com/user/mike-x-cohen/');

% you could use a system url read, e.g., curl on linux

%%
