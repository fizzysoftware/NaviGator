# NaviGator


NaviGator is cool product, unobtrusive yet highly visible web navbar that sits at the top of your website and is a great way to engage users and get them to take to your blog, new product or anywhere you want.


## Development Setup

### Clone the repository and make a copy to start the new application
```
git clone https://github.com/fizzysoftware/NaviGator.git
```

### Install dependencies (ensure bundler is installed)
```
cd NaviGator
bundle install
```

CREATE database config (sample config is in config/database.sample.yml)
```
cp config/database_sample.yml config/database.yml
# make the appropirate changes 

```

Setup DB
```
rake db:create
rake db:migrate
rake db:seed
```


Start the Server
```
rails s
```


For Background Jobs(Sending mail etc)
```
rake jobs:work
```

Demo
----

There is a demo available at [http://navi.deskgator.com/](http://navi.deskgator.com/)


Deploying
----------

  * Change the `config/deploy.rb` accordingly.
  * Setup server and deploy

```bash
cap production deploy:setup
cap production deploy:cold
```

Copyright
---------

Copyright (c) 2012-2013 [Fizzy Software](http://www.fizzysoftware.com). See LICENSE for details.


Disclaimer
---------

This was a hackathon project which we do not maintain actively. Feel free to fork and improve :)

