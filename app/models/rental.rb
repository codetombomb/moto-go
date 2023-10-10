class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :rental_transaction
end
