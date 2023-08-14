module ApplicationHelper
  def weather_description(weather_code)
    case weather_code
    when 0 then "Clear sky"
    when 1, 2, 3 then "Mainly clear, partly cloudy, and overcast"
    when 45, 48 then "Fog and depositing rime fog"
    when 51, 53, 55 then "Drizzle: Light, moderate, and dense intensity"
    when 56, 57 then "Freezing Drizzle: Light and dense intensity"
    when 61, 63, 65 then "Rain: Slight, moderate and heavy intensity"
    when 66, 67 then "Freezing Rain: Light and heavy intensity"
    when 71, 73, 75 then "Snow fall: Slight, moderate, and heavy intensity"
    when 77 then "Snow grains"
    when 80, 81, 82 then "Rain showers: Slight, moderate, and violent"
    when 85, 86 then "Snow showers slight and heavy"
    when 95 then "Thunderstorm: Slight or moderate"
    when 96, 99 then "Thunderstorm with slight and heavy hail"
    else "Unknown weather code"
    end
  end
end
