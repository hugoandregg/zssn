class CreateContaminationReports < ActiveRecord::Migration[5.0]
  def change
    create_table :contamination_reports do |t|
      t.references :survivor, foreign_key: true
      t.references :reporter, foreign_key: true

      t.timestamps
    end
  end
end
