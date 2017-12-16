class LookupsController < ApplicationController
	def index
		@allClimate = Climate.all
	end
end
