# World Clock

This app is a clock that will tell you your current time based on your location.

You can also add any other location to show the current time there. It uses the Google Maps and Google Timezone API to pull out the timezone from a given location.

Run the app with
```
bin/server
```

In the app itself you'll see you current time based on your location


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
