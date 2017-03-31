class Survivor < ApplicationRecord
	REPORT_LIMIT = 3

	validates :name, :age, :gender, :latitude, :longitude, :infected, presence: true
	validates :gender, inclusion: { in: %w{male female} }
	validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	has_many :inventories, dependent: :destroy
	validates_associated :inventories

	has_many :contamination_reports, foreign_key: 'survivor_id', after_add: :flag_survivor_as_infected

	def transfer(destination_survivor, trade_inventory)
		trade_inventory.each do |inventory|
			mine_inventory = inventories.find_by(item: inventory.item)
			mine_inventory.quantity - inventory.quantity == 0 ? mine_inventory.destroy : mine_inventory.decrement!(:quantity, inventory.quantity)
			destination_survivor.inventories.find_or_create_by(item: inventory.item).increment!(:quantity, inventory.quantity)
		end
	end

	def include_inventory
	    inventories.includes(:item).inject({}) {|inventory_items, inventory|
	      inventory_items[inventory.item.name] = inventory.quantity
	      inventory_items
	    }
	end

    def as_json(args = {})
		super({ methods: :include_inventory }.merge(args))
	end

	def self.non_infected_count
		Survivor.where(infected: false).count
	end

	private

		def flag_survivor_as_infected(contamination_report)
		  	if (contamination_reports.count + 1) == REPORT_LIMIT
		    	update_attribute :infected, true
		  	end
		end
end
