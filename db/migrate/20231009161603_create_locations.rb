class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state_province
      t.string :zip_postal_code
      t.string :country

      t.timestamps
    end
  end
end
