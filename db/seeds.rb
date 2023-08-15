# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

locations = ["New York", "Tokyo", "Manila"]
locations.each do |location|
  data = OpenMeteoService.search_location(location, 1)["results"].first
  latitude = data["latitude"]
  longitude = data["longitude"]
  country = data["country"]
  city = data["name"]

  forecast = OpenMeteoService.get_forecast(latitude, longitude)

  current_weather_data = forecast['current_weather']
  hourly_forecast = forecast["hourly"]
  new_location = Location.create(name: city, country: country)
  current_weather = CurrentWeather.create(
    temperature: current_weather_data['temperature'],
    windspeed: current_weather_data['windspeed'],
    winddirection: current_weather_data['winddirection'],
    weathercode: current_weather_data['weathercode'],
    time: current_weather_data['time'],
    location: new_location
  )

  HourlyForecast.create(data: hourly_forecast, location: new_location)
  puts "#{location}'s current weather inserted"
end