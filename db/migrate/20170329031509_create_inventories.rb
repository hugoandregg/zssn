class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.references :survivor, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
