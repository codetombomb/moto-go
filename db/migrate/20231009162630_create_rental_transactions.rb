class CreateRentalTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :rental_transactions do |t|
      t.float :total
      t.bigint :rental_id
      t.datetime :pick_up_date
      t.datetime :return_date
      t.text :notes

      t.timestamps
    end
  end
end
