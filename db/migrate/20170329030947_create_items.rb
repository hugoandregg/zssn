class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, unique: true, null: false
      t.integer :points, null: false

      t.timestamps
    end
  end
end
