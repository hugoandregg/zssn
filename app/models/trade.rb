class Trade
	def initialize(params)
		@survivor_one = Survivor.find(params[:survivor_one_id])
		@survivor_two = Survivor.find(params[:survivor_two_id])
		
		@survivor_one_items = []
		params[:survivor_one_items].each do |inventory|
			@survivor_one_items << Inventory.new(:item_id => 
				Item.find_by(name: inventory[:name]).id, :quantity => 
				inventory[:quantity])
		end
		
		@survivor_two_items = []
		params[:survivor_two_items].each do |inventory|
			@survivor_two_items << Inventory.new(:item_id => 
				Item.find_by(name: inventory[:name]).id, :quantity => 
				inventory[:quantity])
		end
	end

	def valid?
		print "NON CONTAMINATED > " 
		puts non_contaminated_survivors?
		print "OWN ITEMS > " 
		puts survivors_own_items? 
		print "BALANCED > " 
		puts is_balanced?
		non_contaminated_survivors? && survivors_own_items? && is_balanced?
	end

	def begin
		if valid?
			puts "validou"
			@survivor_one.transfer(@survivor_two, @survivor_one_items)
			@survivor_two.transfer(@survivor_one, @survivor_two_items)
			@survivor_one.save && @survivor_two.save
		end
	end

	private
		def non_contaminated_survivors?
			!(@survivor_one.infected? or @survivor_two.infected?)
		end

		def is_balanced?
			sum_points(@survivor_one_items) == sum_points(@survivor_two_items)
		end

		def sum_points(items)
			count = 0
			items.each do |inventory|
				count += inventory.item.points * inventory.quantity
			end

			count
		end

		def survivors_own_items?
			survivor_owns_items?(@survivor_one, @survivor_one_items) && survivor_owns_items?(@survivor_two, @survivor_two_items)
		end

		def survivor_owns_items?(survivor, trade_items)
			trade_items.each do |trade_item|
				inventory = Inventory.where({survivor: survivor, item: trade_item.item}).first
				if inventory.quantity < trade_item.quantity
					return false
				end
			end

			true
		end
end