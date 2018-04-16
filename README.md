Travel Agency - Moon

We have created a website with Ruby on Cloud 9 IDE.
__________________________________
CREATING USERS AND LOGIN WITH DEVISE

First add gem 'devise' to your gemfile

Then run

```
bundle install
```
and then

```
rails generate devise:install
```

After that you can create your model. In our case:

```
rails generate devise User
```

Now you can migrate the db

```
rake db:migrate
```

______________________________
CREATING ALL THE NECESSARY SCAFFOLDS

we have added the following scaffolds:
 -accommodations
 -offers
 -countries
 -comments
 -places
 -reservations
 
 Example:
 
 ```
 rails g scaffold Accomomdations title:string content:text image:string
 ```
