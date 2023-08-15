require 'pry'

# make this controller slim
# too much duplication
# 

class StaticPagesController < ApplicationController
  def index
    @preset_locations = Location.first(3)
  end

  def search
    location = params[:location]
    if location.present?
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
      # binding.pry
      HourlyForecast.create(data: hourly_forecast, location: new_location)
  
      @current_weather = new_location.current_weather
    end
  end
end
