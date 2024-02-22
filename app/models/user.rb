class User < ApplicationRecord
    has_secure_password
    has_one :location, dependent: :destroy
    has_many :rentals, dependent: :destroy
    has_many :owned_vehicles, class_name: "Vehicle"
    has_many :bikes, through: :rentals, source: :vehicle
    has_many :rental_transactions, through: :rentals

    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true, uniqueness: true
end
