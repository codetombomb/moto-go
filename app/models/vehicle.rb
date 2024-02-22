class Vehicle < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :rentals, dependent: :destroy
    has_many :renters, through: :rentals, source: :user
    has_many :rental_transactions, through: :rentals
    alias_attribute :owner, :user
end
