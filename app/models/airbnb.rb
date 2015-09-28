#
# class Airbnb
#
#   attr_reader :array
#
#   def initialize(latitude, longitude)
#     @latitude = latitude.to_i
#     @longitude = longitude.to_i
#     @swlatitude = @latitude-4
#     @swlongitude = @longitude-6
#     @response = get_response
#     @array = []
#   end
#
#    def get_places
#      if @response["result"]!=[]
#        x=0
#       @response["result"].each do
#         new_hash = {
#           heading: @response["result"][x]["attr"]["heading"],
#           location: @response["result"][x]["location"]["all"],
#           dwelling_type: @response["result"][x]["attr"]["propType"]["text"],
#           number_of_bedrooms: @response["result"][x]["attr"]["bedrooms"],
#           occupancy: @response["result"][x]["attr"]["occupancy"],
#           beds: @response["result"][x]["attr"]["beds"],
#           bathrooms: @response["result"][x]["attr"]["bathrooms"],
#           description: @response["result"][x]["attr"]["description"],
#           monthly_price: @response["result"][x]["price"]["monthly"],
#           weekly_price: @response["result"][x]["price"]["weekly"],
#           nightly_price: @response["result"][x]["price"]["nightly"],
#           url: @response["result"][x]["provider"]["url"]
#         }
#         @array<<new_hash
#       end
#       @array
#     else
#       "There are no results in the searched area (sorry :( )"
#     end
#    end
#
#
#    private
#
#     def get_response
#      key=ENV['ZILYO_KEY']
#      response = HTTParty.get(   "https://zilyo.p.mashape.com/search?isinstantbook=true&nelatitude=#{@latitude}&nelongitude=#{@longitude}&provider=airbnb&swlatitude=#{@swlatitude}&swlongitude=#{@swlongitude}",  headers: {
#        "X-Mashape-Key"=>"#{key}",
#        "Accept" => "application/json"
#      })
#
#      JSON.parse(response)
#    end
#
#
#
# end


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
       new_hash = Hash.new
      @response["result"].each do
        new_hash = {}
        new_hash["heading"] = @response["result"][x]["attr"]["heading"]  #short info about place
        new_hash["location"] = @response["result"][x]["location"]["all"] #location information
        new_hash["dwelling_type"] = @response["result"][x]["attr"]["propType"]["text"] #apartment or house
        new_hash["number_of_bedrooms"] = @response["result"][x]["attr"]["bedrooms"] #number of bedrooms
        new_hash["occupancy"] = @response["result"][x]["attr"]["occupancy"] #occupancy
        new_hash["beds"] = @response["result"][x]["attr"]["beds"] # number of beds
        new_hash["bathrooms"] = @response["result"][x]["attr"]["bathrooms"] #number of bathrooms
        new_hash["description"] = @response["result"][x]["attr"]["description"] #location description
        new_hash["monthly_price"] = @response["result"][x]["price"]["monthly"] #monthly price
        new_hash["weekly_price"] = @response["result"][x]["price"]["weekly"] #weekly price
        new_hash["nightly_price"] = @response["result"][x]["price"]["nightly"] #nightly price
        new_hash["url"] = @response["result"][x]["provider"]["url"] #url
        @array<<new_hash
        x +=1
      end
      @array
    else
      "There are no results in the searched area (sorry :( )"
    end
   end


   private

    def get_response
     key=ENV['ZILYO_KEY']
     response = HTTParty.get(   "https://zilyo.p.mashape.com/search?isinstantbook=true&nelatitude=#{@latitude}&nelongitude=#{@longitude}&provider=airbnb&swlatitude=#{@swlatitude}&swlongitude=#{@swlongitude}",  headers: {
       "X-Mashape-Key"=>"#{key}",
       "Accept" => "application/json"
     })
     JSON.parse(response)
   end
 end
