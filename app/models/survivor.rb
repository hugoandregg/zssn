class Survivor < ApplicationRecord
	REPORT_LIMIT = 3

	validates :name, :age, :gender, :latitude, :longitude, presence: true
	validates :gender, inclusion: { in: %w{male female} }
	validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	has_many :inventories, dependent: :destroy
	validates_associated :inventories

	has_many :contamination_reports, foreign_key: 'survivor_id', after_add: :flag_survivor_as_infected

	def include_inventory
	    inventories.includes(:item).inject({}) {|inventory_items, inventory|
	      inventory_items[inventory.item.name] = inventory.quantity
	      inventory_items
	    }
	end

    def as_json(args = {})
		super({ methods: :include_inventory }.merge(args))
	end

	private

		def flag_as_contaminated(contamination_report)
		  	if contamination_reports.count == REPORT_LIMIT
		    	update_attribute :infected, true
		  	end
		end
end
