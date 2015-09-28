
class Airbnb

  attr_reader :array

  def initialize(latitude, longitude)
    @latitude = latitude.to_i
    @longitude = longitude.to_i
    @swlatitude = @latitude-4
    @swlongitude = @longitude-6
    @response = get_response
    @array = []
  end

   def get_places
     if @response["result"]!=nil
       x=0
      @response["result"].each do
        new_hash = {
          heading: @response["result"][x]["attr"]["heading"],
          location: @response["result"][x]["location"]["all"],
          dwelling_type: @response["result"][x]["attr"]["propType"]["text"],
          number_of_bedrooms: @response["result"][x]["attr"]["bedrooms"],
          occupancy: @response["result"][x]["attr"]["occupancy"],
          beds: @response["result"][x]["attr"]["beds"],
          bathrooms: @response["result"][x]["attr"]["bathrooms"],
          description: @response["result"][x]["attr"]["description"],
          monthly_price: @response["result"][x]["price"]["monthly"],
          weekly_price: @response["result"][x]["price"]["weekly"],
          nightly_price: @response["result"][x]["price"]["nightly"],
          url: @response["result"][x]["provider"]["url"]
        }
        @array<<new_hash
      end
      @array
    else
      "There are no results in the searched area (sorry :( )"
    end
   end


   private

    def get_response
     key=ENV['ZILYO_KEY']
     HTTParty.get(   "https://zilyo.p.mashape.com/search?isinstantbook=true&nelatitude=#{@latitude}&nelongitude=#{@longitude}&provider=airbnb&swlatitude=#{@swlatitude}&swlongitude=#{@swlongitude}",  headers: {
       "X-Mashape-Key"=>"#{key}",
       "Accept" => "application/json"
     })

   end




end
