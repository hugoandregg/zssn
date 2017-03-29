require 'rails_helper'

RSpec.describe Survivor, type: :model do
  it { should have_many(:inventories).dependent(:destroy) }
  it { should have_many(:contamination_reports) }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:age) }
  it { should_not allow_value(-1).for(:age) }
  it { should_not allow_value(0).for(:age) }
  it { should ensure_inclusion_of(:gender).in_array(%w[male female]) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:infected) }
end
