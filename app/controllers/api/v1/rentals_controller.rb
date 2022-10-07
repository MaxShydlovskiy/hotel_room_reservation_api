class Api::V1::RentalsController < ApplicationController
  before_action :set_api_v1_rental, only: %i[ show update destroy ]

  # GET /api/v1/rentals
  def index
    @api_v1_rentals = Api::V1::Rental.all

    render json: @api_v1_rentals
  end

  # GET /api/v1/rentals/1
  def show
    render json: @api_v1_rental
  end

  # POST /api/v1/rentals
  def create
    @api_v1_rental = Api::V1::Rental.new(api_v1_rental_params)

    if @api_v1_rental.save
      render json: @api_v1_rental, status: :created, location: @api_v1_rental
    else
      render json: @api_v1_rental.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/rentals/1
  def update
    if @api_v1_rental.update(api_v1_rental_params)
      render json: @api_v1_rental
    else
      render json: @api_v1_rental.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/rentals/1
  def destroy
    @api_v1_rental.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_rental
      @api_v1_rental = Api::V1::Rental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_rental_params
      params.require(:api_v1_rental).permit(:status)
    end
end
