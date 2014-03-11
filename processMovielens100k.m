% Download Movielens 100K from 
% http://grouplens.org/datasets/movielens/
% Extract the data in a folder.
% This function extracts the following
% (1) Item metadata, title, release date.
% (2) Ratings and timestamps
% There are 943 users and 1682 movies
% See README for details
%
% Written by Emtiyaz, EPFL
% Modified on March 11, 2014
%
%TODO: add user info

clear all
display = 1;
saveOut = 1;

% read user ratings in a sparse matrix (nUser X nMovies)
fileName = 'u.data';
data = importdata(fileName);
if display; fprintf('First 4 lines in %s should be the following:',fileName); end;
data(1:4,:)
nUsers = length(unique(data(:,1)));
nMovies = length(unique(data(:,2)));
% user ratings
ratings = sparse(data(:,2), data(:,1), data(:,3), nMovies, nUsers);
% timestamps
tt = data(:,4);
time0 = min(tt); % approximately 27.7 years after 1/1/1970 UTC
tt = floor((tt - time0)/(24*3600)); % subtract the first time, and convert it into days instead of seconds
timeStamp = sparse(data(:,2), data(:,1), tt, nMovies, nUsers);

% movie information
fileName = 'u.item';
out = importdata(fileName,'|');
data = out.data;
if display; fprintf('First 4 lines in %s should be the following:',fileName); end;
data(1:4,:)
movieInformation = out.textdata; % title, release date etc
movieMetaData = sparse(data); % genres information
fileName = 'u.genre';
out = importdata(fileName,'|');
genreNames = out.rowheaders'; % genre names
  %TODO: extract movie release date

% Plot to watch ratings fill in with time
for t = 1:5:max(tt)
  mask = (timeStamp < t);
  caxis([0 5]);
  imagesc(mask.*ratings); colorbar;
  title(sprintf('day = %d',t));
  drawnow
  pause(.001);
end
