class Item < ApplicationRecord
	validates :name, presence: true
	validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :name, uniqueness: true
end
