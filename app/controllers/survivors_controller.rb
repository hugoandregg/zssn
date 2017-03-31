class SurvivorsController < ApplicationController
	def index
		@survivors = Survivor.all
		json_response(@survivors)
	end

	def create
		@survivor = Survivor.create(survivor_params.except(:inventory))
		
		survivor_params[:inventory].each do |inventory|
			@survivor.inventories.build({:item_id => Item.find_by(name: inventory[:name]).id, :quantity => inventory[:quantity]})
		end
		
		if @survivor.save
			json_response(@survivor, :created)
		else
			json_response(@survivor, :unprocessable_entity)
		end
	end

	private
		def survivor_params
			params.require(:survivor).permit(:name, :age, :gender, :latitude, 
				:longitude, inventory: [:name, :quantity])
		end
end
