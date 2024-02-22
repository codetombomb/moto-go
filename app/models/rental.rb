class Rental < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :vehicle, dependent: :destroy
  has_one :rental_transaction
  alias_attribute :owner, :user
end
