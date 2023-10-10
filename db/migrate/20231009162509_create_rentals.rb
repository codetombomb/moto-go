class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vehicle
      t.integer :cost_per_day
      t.datetime :start_date
      t.datetime :end_date
      t.text :description

      t.timestamps
    end
  end
end
