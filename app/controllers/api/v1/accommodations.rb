module API
  module V1
    class Accommodations < Grape::API
      helpers AccommodationsHelper
      helpers PaginationHelpers

      resource :accommodations do
        # GET /api/v1/accommodations
        desc 'Return all accommodations'
        params do
          use :filter_query, :pagination
        end
        get '' do
          scope = API::V1::Accommodation.all
          scope = apply_filters(scope)
          scope, meta = apply_pagination(scope)

          {
            **ActiveModelSerializers::SerializableResource.new(scope).as_json(root: 'accommodations'),
            **meta
          }
        end

        # GET /api/v1/accommodations/1
        desc 'Return accommodation'
        params do
          requires :id, type: Integer, desc: 'ID of accommodation'
        end
        get ':id' do
          API::V1::Accommodation.find(params[:id])
        end

        # POST /api/v1/accommodations
        desc 'Creates accommodation'
        params do
          requires :typeOfHotel, type: String, values: %w[hotel hostel apparthotel],  desc: 'Type of accommodation'
          requires :country,     type: String, desc: 'Country'
          requires :city,        type: String, desc: 'City'
          requires :street,      type: String, desc: 'City'
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
