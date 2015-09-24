require 'httparty'
class Airbnb

   def initialize
     @response = get_response
   end

   private def get_response
     key = ENV['ZILYO_KEY']
     HTTParty.get("https://zilyo.p.mashage.com/search",  initheader = {
       "X-Mashape-Key"=>"#{key}",
       "Accept" => "application/json"
     })
   end




end
