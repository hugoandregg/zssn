require 'rails_helper'

RSpec.describe Inventory, type: :model do
  	it { should belong_to :survivor }
	it { should validate_presence_of :survivor }
	it { should belong_to :item }
	it { should validate_presence_of :item }
end
