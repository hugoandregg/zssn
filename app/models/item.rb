class Item < ApplicationRecord
	validates :name, :points, presence: true
	validates :name, uniqueness: true
end
