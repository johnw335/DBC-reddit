DBC-reddit
==========


### Team: Patrick, Emily, John, & Alex

<p>Our project is to build a DBC specific version of Reddit, that would allow a user to login through socrates and view, create, edit and delete a post. Users would also be able to vote on comments and posts, and would have a home page that shows the most popular and recent posts from their subreddits.</p>

###How to do stuff
Step 1) Clone our repo onto your computer
Step 2) In the command line, run rake db:drop to remove any old files
Step 3) In the command line, run rake db:create && rake db:migrate && rake db:seed
Step 4) Star your server by typing Rails server in the command line
Step 5) Open up your favorite browser and go to [local host](http://localhost:3000/)

###Trello Board
[Trello Site](https://trello.com/b/OHTeN4sL/dbc-reddit-app)

###Schema Design
![Schema Design](schema.png)

###User Stories
* As a user, I want to sign in using my socrates account
* As a user, I want to view all of the posts in descending order by votes
* As a user, I want to create posts
* As a user, I want to edit and delete posts that I have made
* As a user, I want to comment on posts
* As a user, I want to vote on posts
* As a user, I want to vote on comments
* As a user, I want to create a subreddit
* As a user, I want to subscribe to a subreddit




