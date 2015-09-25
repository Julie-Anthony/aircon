require 'httparty'
class Airbnb

   def initialize
     @response = get_response
   end

   def get_places(latitude, longitude)
     if @response["result"]!=[]
       x=0
      @response["result"][x]["attr"]["heading"]
      @response["result"][x]["location"]["all"]
      @response["result"][x]["attr"]["propType"]["text"]#apartment
      @response["result"][x]["attr"]["bedrooms"]
      @response["result"][x]["attr"]["occupancy"]
      @response["result"][x]["attr"]["beds"]
      @response["result"][x]["attr"]["bathrooms"]
      @response["result"][x]["attr"]["description"]
      @response["result"][x]["price"]["monthly"]
      @response["result"][x]["price"]["weekly"]
      @response["result"][x]["price"]["nightly"]
      @response["result"][x]["provider"]["url"]
    else
      "There are no results in the searched area (sorry :( )"
    end
   end


   private def get_response
     key = ENV['ZILYO_KEY']
     HTTParty.get("https://zilyo.p.mashage.com/search",  initheader = {
       "X-Mashape-Key"=>"#{key}",
       "Accept" => "application/json"
     })
   end




end
