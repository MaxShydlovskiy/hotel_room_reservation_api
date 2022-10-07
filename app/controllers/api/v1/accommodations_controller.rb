class Api::V1::AccommodationsController < ApplicationController
  before_action :set_api_v1_accommodation, only: %i[ show update destroy ]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /api/v1/accommodations
  def index
    @api_v1_accommodations = Api::V1::Accommodation.all

    render json: @api_v1_accommodations
  end

  # GET /api/v1/accommodations/1
  def show
    render json: @api_v1_accommodation
  end

  # POST /api/v1/accommodations
  def create
    @api_v1_accommodation = Api::V1::Accommodation.new(api_v1_accommodation_params)

    if @api_v1_accommodation.save
      render json: @api_v1_accommodation, status: :created, location: @api_v1_accommodation
    else
      render json: @api_v1_accommodation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/accommodations/1
  def update
    if @api_v1_accommodation.update(api_v1_accommodation_params)
      render json: @api_v1_accommodation
    else
      render json: @api_v1_accommodation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/accommodations/1
  def destroy
    @api_v1_accommodation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_accommodation
      @api_v1_accommodation = Api::V1::Accommodation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_accommodation_params
      params.require(:api_v1_accommodation).permit(:description, :type_of_hotel)
    end
end
