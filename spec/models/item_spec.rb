require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:points) }
  it { should_not allow_value(-1).for(:points) }
end
