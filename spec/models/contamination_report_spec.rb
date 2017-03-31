require 'rails_helper'

RSpec.describe ContaminationReport, type: :model do
  it { should belong_to :survivor }
	it { should validate_presence_of :survivor }
	it { should belong_to :reporter }
	it { should validate_presence_of :reporter }
end
