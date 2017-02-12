# Cecil-Lemkin Family Archive
This repository will house the code for a web app that allows
a user to administrate and curate pictures/videos that will show up on a slick front end
to display to others visiting as an archive of our family history.

# To Run
Assuming you have ruby, rvm, and rails installed  

*  Run the following:  

>bundle install    
rake db:create    
rake db:migrate    
rails server  

* Use the sign up and create a user, then use that login to view the archive

# Local Development caveats
* For local development you'll want to change a few configurations:     

Firstly, when using rails server, it should be served at localhost:3000/archive     
This is due to the mount_location.rb config file overriding the config.ru relative path     
You can change this in the mount_location.rb file, and replace with '/' if you like for local dev.      
There will be a few places in code that will redirect to /archive, so be wary.      
        
When running, before rails server, you want to run the following command:       
RAILS_RELATIVE_URL_ROOT=/archive RAILS_ENV=production bundle exec rake assets:precompile        
        
The secret_token.rb and database.yml files are pointing at environment variables.       
Either et those up, or replace with you local database and secret key information.      
You can generate a secret key with 'rake secret'        
        
This is all set up and served with unicorn and rbenv        
The unicorn.rb config file sets all of this up for production.      
        
You'll need an init file on your server to execute unicorn as a service.        