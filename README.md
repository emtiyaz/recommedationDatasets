<h1>Datasets for Recommendation System</h1>

<h2> Sushi Data </h2>
Download data sushi3.tgz from [Toshihiro Kamashima's website](http://www.kamishima.net/sushi/) and extract the data in a folder.

Running function [processSushiData.m](processSushiData.m) extracts the following from sushi3 data 
(1) User and item metadata, 
(2) Rankings for sushi A and sushi B
(3) Ratings for sushi B
There are 5000 users and 100 sushis, with rankings for 10 sushis (randomly chosen subset). See README in the Sushi data for details

<h2> Movielens-100K Data </h2>
Running function [processMovielens100k.m](processMovielens100k.m) extracts the following:
(1) Item metadata, title, release date.
(2) Ratings and timestamps
There are 943 users and 1682 movies. See README for details

