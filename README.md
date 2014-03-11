<h1>Datasets for Recommendation System</h1>

<h2> Sushi Data </h2>
Download data sushi3.tgz from [Toshihiro Kamashima's website](http://www.kamishima.net/sushi/) and extract the data in a folder.

Running function [processSushiData.m](processSushiData.m) extracts the following from sushi3 data 
<ol>
<li> User and item metadata, 
<li> Rankings for sushi A and sushi B
<li> Ratings for sushi B
</ol>
There are 5000 users and 100 sushis, with rankings for 10 sushis (randomly chosen subset). See README in the Sushi data for details

<h2> Movielens-100K Data </h2>
Running function [processMovielens100k.m](processMovielens100k.m) extracts the following:
<ol> 
<li>Item metadata, title, release date.
<li> Ratings and timestamps
</ol>
 There are 943 users and 1682 movies. See README for details
