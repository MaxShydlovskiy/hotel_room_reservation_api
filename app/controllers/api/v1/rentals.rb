module API
  module V1
    class Rentals < Grape::API

      # GET /api/v1/rentals
      resource :rentals do
        desc 'Return all rentals'
        get '' do
          @api_v1_rentals = Api::V1::Rental.all
        #  @api_v1_rentals = @api_v1_rentals.filter_by_status(params[:status]) if params[:status].present?
        #  @api_v1_rentals = @api_v1_rentals.filter_by_accommodation(params[:accommodation_id]) if params[:accommodation_id].present?
        #  @api_v1_rentals = @api_v1_rentals.filter_by_datetime(params[:datetime]) if params[:datetime].present?
        end
      end

      # GET /api/v1/rentals/1
      desc 'Return rental'
      params do
        requires :id, type: Integer, desc: 'ID of rental'
      end
      get ':id' do
        @api_v1_rental = API::V1::Rental.find(params[:id])
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

        # before_action :set_api_v1_rental, only: %i[ show update destroy ]
        #
        # # GET /api/v1/rentals
        # def index
        #   @api_v1_rentals = Api::V1::Rental.all
        #   @api_v1_rentals = @api_v1_rentals.filter_by_status(params[:status]) if params[:status].present?
        #   @api_v1_rentals = @api_v1_rentals.filter_by_accommodation(params[:accommodation_id]) if params[:accommodation_id].present?
        #   @api_v1_rentals = @api_v1_rentals.filter_by_datetime(params[:datetime]) if params[:datetime].present?
        #
        #   render json: @api_v1_rentals
        # end
        #
        # # GET /api/v1/rentals/1
        # def show
        #   render json: @api_v1_rental
        # end
        #
        # # POST /api/v1/rentals
        # def create
        #   @api_v1_rental = Api::V1::Rental.new(api_v1_rental_params)
        #
        #   if @api_v1_rental.save
        #     render json: @api_v1_rental, status: :created, location: @api_v1_rental
        #   else
        #     render json: @api_v1_rental.errors, status: :unprocessable_entity
        #   end
        # end
        #
        # # PATCH/PUT /api/v1/rentals/1
        # def update
        #   if @api_v1_rental.update(api_v1_rental_params)
        #     render json: @api_v1_rental
        #   else
        #     render json: @api_v1_rental.errors, status: :unprocessable_entity
        #   end
        # end
        #
        # # DELETE /api/v1/rentals/1
        # def destroy
        #   @api_v1_rental.destroy
        # end
        #
        # private
        #   # Use callbacks to share common setup or constraints between actions.
        #   def set_api_v1_rental
        #     @api_v1_rental = Api::V1::Rental.find(params[:id])
        #   end
        #
        #   # Only allow a list of trusted parameters through.
        #   def api_v1_rental_params
        #     params.require(:api_v1_rental).permit(:status, :datetime, user_id, accommodation_id)
        #   end
    end
  end
end
