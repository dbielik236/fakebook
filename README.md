# Fakebook

This app is intended to mimic Facebook's friending, posting, and commenting abilities, as well as a "news feed" that shows the posts of the user and all of their friends. It was built using Ruby on Rails and styled with Bootstrap. In all, it took me about two weeks to complete, with about a day for thinking through the associations and models before starting to write the code, and then a few days of debugging/final details/final styling touches at the end. The application suffers from the absence of JavaScript, but still has an overall nice feel and look to it. It is responsive and displays well on a variety of screen sizes.

![Screen Shot 2022-09-03 at 2 45 05 PM](https://user-images.githubusercontent.com/95592670/188284156-b0b014d3-78a0-49b5-9017-5fde7ffdb97e.png)

## Features
<ul> 
  <li> Users must sign up or log in to view anything in their account (uses Devise gem)
  <li> Users have the ability to send "friend requests" to become "friends" with all other users
  <li> A dashboard displays all sent requests and friend requests to accept from other users
  <li> User's profile is updatable and can only seen (in full) by friends
  <li> The user's "news feed" shows all posts of user and friends of user
  <li> Users can comment on posts of their own or friends
  <li> Users can delete friendships, posts, comments, and even their full account
 </ul>
  
## Reflection

Overall I'm very happy with how the project turned out. I deepened my knowledge of several topics including relational databases, associations, the rails MVC pattern, database querying, Bootstrap, partials, and HTML/embedded Ruby.

Some things I found challenging about this project were setting up the associations between databases and buttons to create and delete friend requests and friendships. I learned a lot from overcoming these challenges. 

If I were to expand the capabilities of the app, I could add the ability to comment on comments, posting pictures and not just text, profile pictures, liking, and welcome/password recovery mailers.

## Live Preview

**Access the app here:** https://blooming-temple-89582.herokuapp.com/users/sign_in
<br>_(please allow approx. 30 seconds for the dyno to load)_

You can use the following log in for a quick look at the functionality of the app:
<br>**Email:** `guest@gmail.com`
<br>**Password:** `password`
