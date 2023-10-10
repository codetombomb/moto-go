class AddUserIdToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :user_id, :bigint
  end
end
