class RentalSerializer < ActiveModel::Serializer
  attributes :id, :cost_per_day, :description
  belongs_to :owner
  belongs_to :vehicle
end
