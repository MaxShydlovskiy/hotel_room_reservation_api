module API
  module V1
    class Accommodations < Grape::API
      helpers AccommodationsHelper
      include API::V1::Defaults
      # include Grape::Kaminari
      helpers PaginatesHelper
      # include Pagy::Backend

      resource :accommodations do
        # GET /api/v1/accommodations
        desc 'Return all accommodations, paginated'
        params do
          use :filter_query #:pagination
        end
        get '' do
          scope = API::V1::Accommodation.all
          meta, collection = paginate(scope)
          { 
            scope: scope.page(params[:page]).per(18), 
            meta: meta }
          # scope = ActiveModelSerializers::SerializableResource.new(collection)
          # scope.to_json(serialization_context: ActiveModelSerializers::SerializationContext.new(request))
          # {
            # **ActiveModelSerializers::SerializableResource.new(collection).as_json, # { data: ... }
            # **meta
          # }
         #  {
            # api_v1_accommodations: @api_v1_accommodations.page(params[:page]).per(18)
            # meta? or collection
          # }
          # scope = API::V1::Accommodation.all
          # scope = apply_filters(scope)
          # {
            # **ActiveModelSerializers::SerializableResource.new(scope).as_json
            # **paginate
          # }
        end

        # GET /api/v1/accommodations/1
        desc 'Return accommodation'
        params do
          requires :id, type: Integer, desc: 'ID of accommodation'
        end
        get ':id' do
          # paginate per_page: 10, max_per_page: 200
          @accommodation = API::V1::Accommodation.find(params[:id])
        end

        # POST /api/v1/accommodations
        desc 'Creates accommodation'
        params do
          requires :typeOfHotel, type: String, values: %w[hotel hostel apparthotel],  desc: 'Type of accommodation'
          requires :country,     type: String, desc: 'Country'
          requires :city,        type: String, desc: 'City'
          requires :street,      type: String, desc: 'Street'
          requires :phoneNumber, type: String, desc: 'Phone number'
          optional :description, type: String, desc: 'Description'
        end
        post '' do
          API::V1::Accommodation.create(permitted_params)
        end
      end
    end
  end
end
