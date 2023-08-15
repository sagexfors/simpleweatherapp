class HourlyForecastsController < ApplicationController
  def show
    @hourly_forecast = HourlyForecast.find(params[:id])
    @forecast_data = @hourly_forecast.data
  end
end
