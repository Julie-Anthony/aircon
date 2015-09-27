
class Airbnb

  attr_reader :array

  def initialize(latitude, longitude)
    @latitude = latitude.to_i
    @longitude = longitude.to_i
    @swlatitude = @latitude-4
    @swlongitude = @longitude-6
    response_hash = {"response" => get_response}
    @response = response_hash
    @array = []
  end

   def get_places
     if @response["result"]!=[]
       x=0
       new_hash = Hash.new
      @response["result"].each do
        heading = {heading => @response["result"][x]["attr"]["heading"]}  #short info about place
        location = {location => @response["result"][x]["location"]["all"]} #location information
        dwelling_type = { dwelling_type => @response["result"][x]["attr"]["propType"]["text"]}#apartment or house
        number_of_bedrooms = {number_of_bedrooms => @response["result"][x]["attr"]["bedrooms"]} #number of bedrooms
        occupancy = {occupancy => @response["result"][x]["attr"]["occupancy"]} #occupancy
        beds = {beds => @response["result"][x]["attr"]["beds"]} # number of beds
        bathrooms = {bathrooms => @response["result"][x]["attr"]["bathrooms"]} #number of bathrooms
        description = {description => @response["result"][x]["attr"]["description"]} #location description
        monthly_price = {monthly_price => @response["result"][x]["price"]["monthly"]} #monthly price
        weekly_price = {weekly_price => @response["result"][x]["price"]["weekly"]} #weekly price
        nightly_price = {nightly_price => @response["result"][x]["price"]["nightly"]} #nightly price
        url = {url => @response["result"][x]["provider"]["url"]} #url
        new_hash<<heading
        new_hash<<location
        new_hash<<dwelling_type
        new_hash<<number_of_bedrooms
        new_hash<<occupancy
        new_hash<<beds
        new_hash<<bathrooms
        new_hash<<description
        new_hash<<monthly_price
        new_hash<<weekly_price
        new_hash<<nightly_price
        new_hash<<url
        @array<<new_hash
      end
      @array
    else
      "There are no results in the searched area (sorry :( )"
    end
   end


   private def get_response
     key = ENV['ZILYO_KEY']

     HTTParty.get(   "https://zilyo.p.mashape.com/search?isinstantbook=true&nelatitude=#{@latitude}&nelongitude=-#{@longitude}&provider=airbnb%2Chousetrip&swlatitude=#{@swlatitude}&swlongitude=-#{@swlongitude}",  initheader = {
       "X-Mashape-Key"=>"#{key}",
       "Accept" => "application/json"
     })
   end




end
