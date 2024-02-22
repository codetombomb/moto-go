class RentalTransaction < ApplicationRecord
  belongs_to :rental, required: false, dependent: :destroy
end
