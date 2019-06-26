# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - I used Corneal to start
- [x] Use ActiveRecord for storing information in a database - AR is setup in my environment.rb file
- [x] Include more than one model class (e.g. User, Post, Category) - Included User and Wine Model
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) User has many wines
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) Wines belong to users
- [x] Include user accounts with unique login attribute (username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users - My show view checks session.user_id which is set to logged in user and only shows those wines.
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
