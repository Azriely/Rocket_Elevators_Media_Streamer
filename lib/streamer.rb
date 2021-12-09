require 'open_weather'

module ElevatorMedia
    class Streamer

        def getContent (city, type)
            
            weather =  self.getWeather(city)
            # puts "weather #{weather}"        
            # puts "city #{city}"
            # puts "type #{type}"
            html = "<div class='container'>
                        <div class='widget'>
                            <div class='details'>
                                <div class='temperature'>City: #{weather["name"]}, #{weather["sys"]["country"]}</div>
                                <div class='temperature'>#{weather["main"]["temp"]} °C</div>
                                <div class='summary'>
                                    <p class='summaryText'>#{weather["weather"][0]["description"]}</p>
                                </div>
                                <div class='precipitation'>Humidity: #{weather["main"]["humidity"]}</div>
                                    <div class='wind'>Wind: #{weather["wind"]["speed"]}</div> 
                                </div>
                            </div>
                        </div>
                    </div>"
        
            return html
    
        end
        # Get weather by City then return json
        def getWeather(city)
            options = { units: "metric", APPID: ENV["Weather_API"] }
            OpenWeather::Current.city(city, options)            
        end
    end
end