# World Clock

This app is a clock that will tell you your current time based on the location inputted.
It gets your longitude and latitude through Google's map api, and gets your current time and time zone using Google's Timezone api

Run the app with
```
bin/server
```

In the app itself you can determine your current time based on the search location


Optionally, to use `ActiveRecord` for database operations, add to the `app.rb`:

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```
