class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null:false
      t.boolean :infected, null:false, default: false

      t.timestamps
    end
  end
end
