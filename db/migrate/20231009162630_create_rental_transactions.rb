class CreateRentalTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :rental_transactions do |t|
      t.float :total
      t.bigint :rental_id

      t.timestamps
    end
  end
end
