module AccommodationsHelper
  extend Grape::API::Helpers

  params :filter_query do
    optional :type_of_hotel,
             type: Array[String],
             allow_blank: false,
             values: %w[hotel hostel apparthotel],
             coerce_with: ->(value) { value.is_a?(Array) ? value : [value] },
             desc: "Options: hotel, hostel, apparthotel"
  end

  def apply_filters(scope)
    # ... any logic
    scope
  end
end
