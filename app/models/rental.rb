class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :rental_transaction
  alias_attribute :owner, :user

  validates :vehicle_id, uniqueness: { scope: :user_id, message: "post already exists. Update or delete previous post." }, on: :create
end
