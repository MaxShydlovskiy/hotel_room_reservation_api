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
    scope = API::V1::Rental.joins(:api_v1_accommodation).where('api_v1_rentals.api_v1_accommodation_id like ?')
                                                        .where('reserve_day like ?', "'#{}'")
                                                        .where(status: [:free, :reserved, :archived])
                                                        .where('country LIKE ? OR city LIKE ? OR street LIKE ?')
  end
end
