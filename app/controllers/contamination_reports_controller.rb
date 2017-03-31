class ContaminationReportsController < ApplicationController
	def create
		@survivor = Survivor.find(params[:survivor_id])
		@contamination_report = @survivor.contamination_reports.new(contamination_report_params)

		if @contamination_report.save
			json_response(@contamination_report, :created)
		else
			json_response(@contamination_report, :unprocessable_entity)
		end
	end

	private

	def contamination_report_params
		params.require(:contamination_report).permit(:reporter_id)
	end
end
