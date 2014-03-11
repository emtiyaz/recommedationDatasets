% Download data sushi3.tgz from Toshihiro Kamashima's website 
% http://www.kamishima.net/sushi/
% Extract the data in a folder.
% This function extracts the following from sushi3 data 
% (1) User and item metadata, 
% (2) Rankings for sushi A and sushi B
% (3) Ratings for sushi B
% There are 5000 users and 100 sushis, with
% rankings for 10 sushis (randomly chosen subset).
% See README for details
% 
% Written by Emtiyaz, EPFL
% Modified on March 11, 2014
clear all
display = 1;
saveOut = 1;

%% user features
fileName = 'sushi3.udata';
data = importdata(fileName);
if display; fprintf('First 4 lines in %s should be the following:',fileName); end;
data(1:4,:)
userMetaData = data(:,2:end);
  %NOTE: there is heirarchy in the user features which should be exploited
  %See README

%% item features (sorted according to sushi B list)
fileName = 'sushi3.idata';
out = importdata(fileName);
data = out.data;
sushiNames = out.textdata(:,2); % in Japanese
if display; fprintf('First 4 lines in %s should be the following:',fileName); end;
data(1:4,:)
itemMetaData = data;
  %NOTE: there is heirarchy in the iterm features which should be exploited
  %See README

%% rankings : Sushi A and B
fileName = {'sushi3b.5000.10.order', 'sushi3a.5000.10.order'};
for i = 1:2
  data = importdata(fileName{i});
  data = data'; data = data(:); % now data contains row-wise readings
  data = data(3:end); % ignore the first two entries
  data = reshape(data,12,5000)'; % 5000 users, 10 columns for rankings + 2 id columns 
  if display; fprintf('First 4 lines in %s should be the following:',fileName{i}); end;
  data(1:4,:)
  % assign data to rankingA or rankingB
  if i == 1
    rankingB = data(:,3:end); % ignore first two columns
  elseif i == 2
    rankingA = data(:,3:end); % ignore first two columns
    % map ids of sushi A to that of sushi B
    % mapping is 5->15, 8->26, and so on.
    idxA = [5 8 9 7 6];
    idxB = [15 26 29 8 7];
    for j = 1:length(idxA)
      rankingA(rankingA == idxA(j)) = idxB(j);
    end
  end
end

%% sushi B : ratings
fileName = 'sushi3b.5000.10.score';
data = importdata(fileName);
if display; fprintf('First 2 lines in %s should be the following:',fileName); end;
data(1:2,:) % originally -1 is missing, 0-4 is ratings
data = sparse(data + 1); % now 0 is missing, 1-5 are ratings
data = data';

% save output
if saveOut 
  save('sushi3.mat', 'userMetaData', 'itemMetaData', 'rankingA', 'rankingB');
end

