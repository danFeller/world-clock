require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "date"

key = ENV.fetch("GMAPS_KEY")

get("/") do
  erb(:clock)
end

get("/time") do
  map_url = HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params.fetch("location").squeeze(" ").gsub(" ", "+")}&key=#{key}")
  @location_lat, @location_lng = JSON(map_url).fetch("results")[0].fetch("geometry").fetch("location").fetch("lat"), JSON(map_url).fetch("results")[0].fetch("geometry").fetch("location").fetch("lng")
  now = Time.now
  seconds = now.to_i

  time_zone_url = HTTP.get("https://maps.googleapis.com/maps/api/timezone/json?location=#{@location_lat}%2C#{@location_lng}&timestamp=#{seconds}&key=#{key}")
  @time = JSON(time_zone_url)
  dstOffset, rawOffset, @timeZone = @time.fetch("dstOffset"), @time.fetch("rawOffset"), @time.fetch("timeZoneName")
  @localTime = Time.at(seconds + dstOffset.to_i + rawOffset.to_i)
  erb(:time)
end
