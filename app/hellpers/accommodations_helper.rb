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
                                                        .where(reserve_day: ('Date like ?')..'Date like ?')
                                                        .where(status: [:free, :reserved, :archived])
  end

#  def paginate(scope, default_per_page = 20)
#    collection = scope.page(params[:page]).per((params[:per_page] || default_per_page).to_i)
  
#    current, total, per_page = collection.current_page, collection.total_pages, collection.limit_value
  
#    return [{
#      pagination: {
#        current:  current,
#        previous: (current > 1 ? (current - 1) : nil),
#        next:     (current == total ? nil : (current + 1)),
#        per_page: per_page,
#        pages:    total,
#        count:    collection.total_count
#      }
#    }, collection]
#  end
end
