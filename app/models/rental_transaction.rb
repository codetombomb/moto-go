class RentalTransaction < ApplicationRecord
  belongs_to :rental, required: false
end
