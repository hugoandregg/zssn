class ContaminationReport < ApplicationRecord
  belongs_to :survivor, class_name: 'Survivor'
  belongs_to :reporter, class_name: 'Survivor'

  validates :reporter, uniqueness: { scope: :survivor }
end
