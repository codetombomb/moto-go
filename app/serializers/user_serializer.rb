class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number
  has_one :location
end
