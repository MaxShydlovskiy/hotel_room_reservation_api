class AccommodationSerializer < ActiveModel::Serializer
  attributes :id,
             :type_of_hotel,
             :country,
             :city,
             :description,
             :phone_number
end
