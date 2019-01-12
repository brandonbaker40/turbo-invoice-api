# frozen_string_literal: true

# AgenciesController
class AgenciesController < ApplicationController
  before_action :set_agency, only: %i[show update destroy]

  # GET /agencies
  def index
    @agencies = Agency.all

    render json: @agencies
  end

  # GET /agencies/1
  def show
    render json: @agency
  end

  # POST /agencies
  def create
    @agency = Agency.new(agency_params)

    if @agency.save
      render json: @agency, status: :created, location: @agency
    else
      render json: @agency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agencies/1
  def update
    if @agency.update(agency_params)
      render json: @agency
    else
      render json: @agency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agencies/1
  def destroy
    @agency.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agency
    @agency = Agency.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def agency_params
    # rubocop:disable Metrics/LineLength
    params.require(:agency).permit(:name, :phone, :street_address, :city, :state, :zip_code, :approved)
    # rubocop:enable Metrics/LineLength
  end
end
