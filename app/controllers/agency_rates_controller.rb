# frozen_string_literal: true

# AgencyRatesController
class AgencyRatesController < ApplicationController
  before_action :set_agency_rate, only: %i[show update destroy]

  # GET /agency_rates
  def index
    @agency_rates = AgencyRate.all

    render json: @agency_rates
  end

  # GET /agency_rates/1
  def show
    render json: @agency_rate
  end

  # POST /agency_rates
  def create
    @agency_rate = AgencyRate.new(agency_rate_params)

    if @agency_rate.save
      render json: @agency_rate, status: :created, location: @agency_rate
    else
      render json: @agency_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agency_rates/1
  def update
    if @agency_rate.update(agency_rate_params)
      render json: @agency_rate
    else
      render json: @agency_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agency_rates/1
  def destroy
    @agency_rate.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agency_rate
    @agency_rate = AgencyRate.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def agency_rate_params
    # rubocop:disable Metrics/LineLength
    params.require(:agency_rate).permit(:agency_id, :visit_type_id, :amount, :arrangement)
    # rubocop:enable Metrics/LineLength
  end
end
