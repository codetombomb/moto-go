class Vehicle < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: 'user_id'
    has_many :rentals
    has_many :renters, through: :rentals, source: :user
    has_many :rental_transactions, through: :rentals
end
