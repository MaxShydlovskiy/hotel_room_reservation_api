module AccommodationsHelper
  extend Grape::API::Helpers

  params :filter_query do
    optional :type_of_hotel,
             type: Array[String],
             allow_blank: false,
             values: %w[hotel hostel apparthotel],
             coerce_with: ->(value) { value.is_a?(Array) ? value : [value] },
             desc: "Options: hotel, hostel, apparthotel"
    # Any other filters
  end

  def apply_filters(scope)
    # ... filter logic
    scope = API::V1::Accommodation.where(type_of_hotel: [:hotel, :hostel, :apparthotel])
                                  .where('country LIKE ? OR city LIKE ? OR street LIKE ?')
                                  .joins(:api_v1_rentals)
                                  .where(status: [:free, :reserved, :archived])
                                  # .where('api_v1_rentals.api_v1_accommodation_id = 1')
                                  .where('reserve_day LIKE ?')
                                  
#     scope = API::V1::Rental.where(status: [:free, :reserved, :archived])
#                            .where("api_v1_accommodation_id LIKE ?")
#                            .where('reserve_day LIKE ?')
  end
end
