class Report
	def self.infected
		if Survivor.count > 0
			return Survivor.where(infected: true).count.to_f / Survivor.count
		else
			return 0
		end
	end

	def self.non_infected
		1 - infected
	end

	def self.average_items
		items = [
			{ :water => Inventory.where(item: Item.find_by(name: "Water")).sum(:quantity).to_f / Survivor.non_infected_count },
			{ :food => Inventory.where(item: Item.find_by(name: "Food")).sum(:quantity).to_f / Survivor.non_infected_count },
			{ :medication => Inventory.where(item: Item.find_by(name: "Medication")).sum(:quantity).to_f / Survivor.non_infected_count },
			{ :ammunition => Inventory.where(item: Item.find_by(name: "Ammunition")).sum(:quantity).to_f / Survivor.non_infected_count }
		]
		items
	end

	def self.lost_points
		Inventory.includes(:survivor, :item).where(survivors: { infected: true }).sum("inventories.quantity * items.points")
	end
end