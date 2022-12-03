module API
  module V1
    class Rentals < Grape::API

      # GET /api/v1/rentals
      resource :rentals do
        desc 'Return all rentals'
        get '' do
          @rentals = Api::V1::Rental.all
        end
      end

      # GET /api/v1/rentals/1
      desc 'Return rental'
      params do
        requires :id, type: Integer, desc: 'ID of rental'
      end
      get ':id' do
        @rental = API::V1::Rental.find(params[:id])
      end

      # POST /api/v1/rentals
      desc 'Creates rental'
      params do
        requires :status, type: String, values: %w[free, reserved, archived],  desc: 'Type of rentals status'
        requires :reserveDay,     type: Date, desc: 'Reserve Day'
        requires :accommodationId,        type: Integer, desc: 'Accommodation Id'
        requires :userId,      type: String, desc: 'User Id'
      end
      post '' do
        API::V1::Rental.create(permitted_params)
      end
    end
  end
end
