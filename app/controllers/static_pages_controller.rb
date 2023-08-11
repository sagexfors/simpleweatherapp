class StaticPagesController < ApplicationController
  def index

  end

  def search
    location = params[:location] 
    if location.present?
      @data = OpenMeteoService.search_location(location, 1)
      latitude = @data["results"].first["latitude"]
      longitude = @data["results"].first["longitude"]

      @forecast = OpenMeteoService.get_forecast(latitude, longitude)
    end
  end  
end
