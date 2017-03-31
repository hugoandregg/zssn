require 'rails_helper'

RSpec.describe SurvivorsController, type: :controller do
	# Test suite for POST /survivors
=begin
  	describe 'POST /survivors' do

	    context 'when the request is valid' do
	      	before { post survivors_url, params: { survivor: { age: "22", gender: "male", 
	      		latitude: "53.1232", longitude: "12.3456", name: "Hugo", inventory: [{ name: "Water", quantity: "4" }] } }, as: :json }

			it 'creates a survivor' do
				expect(json['name']).to eq('Hugo')
			end

			it 'returns status code 201' do
				expect(response).to have_http_status(:created)
			end
	    end

	    context 'when the request is invalid' do
			before { post survivors_url, params: { name: "Hugo" } }

			it 'returns status code 422' do
				expect(response).to have_http_status(:unprocessable_entity)
			end
	    end
  	end
=end
end
