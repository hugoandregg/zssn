class TradesController < ApplicationController
	def create
		@trade = Trade.new(trade_params)
		if @trade.begin
			json_response(@trade, :created)
		else
			json_response(@trade, :unprocessable_entity)
		end
	end

	private 
		def trade_params
			params.require(:trade).permit(:survivor_one_id, :survivor_two_id,
			 survivor_one_items: [:name, :quantity], survivor_two_items: [:name, :quantity])
		end
end
