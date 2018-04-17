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
________________________
FACEBOOK LOGIN

add gem to your gemfile:
```
gem 'omniauth-facebook'
```

then add these to users:
```
rails g migration AddOmniauthToUsers provider:string uid:string
rake db:migrate
```

Next, you need to declare the provider in your config/initializers/devise.rb:
```
config.omniauth :facebook, "APP_ID", "APP_SECRET"
```
To implement a callback, the first step is to go back to our config/routes.rb file and tell Devise in which controller we will implement Omniauth callbacks:
```
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
```

Here is an example action for our facebook provider that we could add to our controller:
```
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
```
After the controller is defined, we need to implement the from_omniauth method in our model (e.g. app/models/user.rb):
```
def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end
```
if we need to copy data from session whenever a user is initialized before sign up, we just need to implement new_with_session in our model. Here is an example that copies the facebook email if available:
```
class User < ApplicationRecord
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
```
