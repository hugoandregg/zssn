class Inventory < ApplicationRecord
  belongs_to :survivor
  belongs_to :item

  validates :survivor, :item, presence: true

  validates :survivor, uniqueness: { scope: :item }
end
