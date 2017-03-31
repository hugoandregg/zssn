class LocationsController < ApplicationController
	def update
		@survivor = Survivor.find(params[:survivor_id])

		if @survivor.update_attributes(:latitude => params[:latitude], :longitude => params[:longitude])
			json_response(@survivor)
		end
	end
end
