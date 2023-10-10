class User < ApplicationRecord
    has_secure_password
    has_one :location, dependent: :destroy
    has_many :rentals
    has_many :owned_vehicles, class_name: "Vehicle"
    has_many :bikes, through: :rentals, source: :vehicle
    has_many :rental_transactions, through: :rentals
end
