class DailyForecastsController < ApplicationController
  def show
    @daily_forecast = DailyForecast.find(params[:id])
    @forecast_data = @daily_forecast.data
  end
end
