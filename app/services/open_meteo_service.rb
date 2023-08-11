require 'faraday'
require 'json'

class OpenMeteoService
  GEOCODING_BASE_URL = 'https://geocoding-api.open-meteo.com/v1/search'.freeze
  FORECAST_BASE_URL = 'https://api.open-meteo.com/v1/forecast'.freeze

  def self.search_location(location, count = 1)
    endpoint = "#{GEOCODING_BASE_URL}?name=#{location}&count=#{count}&language=en&format=json"
    self.get_data(endpoint)
  end

  def self.get_forecast(latitude, longitude)
    endpoint = "#{FORECAST_BASE_URL}?latitude=#{latitude}&longitude=#{longitude}&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation_probability,weathercode,windspeed_10m,winddirection_10m&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,precipitation_sum,precipitation_probability_max&timezone=auto&current_weather=true"
    self.get_data(endpoint)
  end

  private

  def self.get_data(url, params = {})
    response = Faraday.get(url, params)
    JSON.parse(response.body)
  end
end


#TODO: SAVE FORECAST DATA TO CURRENT WEATHER, HOURLY FORECAST, DAILY FORECAST