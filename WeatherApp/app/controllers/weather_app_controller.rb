require 'weather-api'

class WeatherAppController < ApplicationController
  protect_from_forgery with: :null_session
  def index
	puts "--------------- In Index -----------------"
	@allClimate = Climate.all
	puts "# of bids = #{@allClimate.size}"
	#@allClimate = @allClimate.sort_by {|climate| [climate.name, climate.temperature]}

  end

  def enterZip
	puts "--------------- In Enter Zip -----------------"
	@name = params[:nameInput]
	@city = params[:locationInput]
	@response = Weather.lookup_by_location(@city, Weather::Units::FAHRENHEIT)
	zip = "00000"
	@temperature = @response.condition.temp.to_s
	@sky = @response.condition.text

	map = {"name" => @name, "zip" => zip, "city" => @city, "temperature" => @temperature, "sky" => @sky}
	newRow = Climate.new(map)
	respond_to do |format|
		if newRow.save
			puts "Success!"
			format.html {redirect_to weather_app_url}
		else
			format.html {redirect_to "/"}	# Can create an error page
		end
	end
  end

  # def getLeader
  # 	puts "--------------- In Get Leader -----------------"
  # 	# Need to sort again, because every request creates
  # 	# a new instance of Controller class (why?)
  # 	@allBids = Bid.all
  # 	@allBids = @allBids.sort_by {|bid| [-bid.amount,bid.bidder]}
  # 	puts "Leader: #{@allBids[0].bidder}"
  # 	respond_to do |format|
  # 		format.html {redirect_to auction_app_url}
  # 	end
  # end

  def handlePost
  	if params[:commit] == "Enter Info"
  		enterZip
  	# elsif params[:commit] == "Get Leader"
  	# 	getLeader
  	end
  end
end
