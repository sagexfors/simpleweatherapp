class Location < ApplicationRecord
  has_one :current_weather
  has_one :hourly_forecast
  has_one :daily_forecast
end
