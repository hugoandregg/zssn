class ReportsController < ApplicationController
  	def infected
    	render json: { data: Report.infected }
  	end

  	def non_infected
    	render json: { data: Report.non_infected }
  	end

  	def average_items_per_survivor
  		render json: { data: Report.average_items }
  	end

  	def lost_points
  		render json: { data: Report.lost_points }
  	end
end
