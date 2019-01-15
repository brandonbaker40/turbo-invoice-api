# frozen_string_literal: true

# VisitsController
class VisitsController < ApplicationController
  require 'uri'

  before_action :set_visit, only: %i[show update destroy]

  # GET /visits
  def index
    # @visits = Visit.all
    @visits = filter_first(Visit)
    render json: @visits
  end

  # GET /visits/1
  def show
    render json: @visit
  end

  # POST /visits
  def create
    @visit = Visit.new(visit_params)

    if @visit.save
      render json: @visit, status: :created, location: @visit
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visits/1
  def update
    if @visit.update(visit_params)
      render json: @visit
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_visit
    @visit = Visit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def visit_params
    # rubocop:disable Metrics/LineLength
    params.require(:visit).permit(:patient_id, :agency_id, :user_id, :visit_type_id, :time_in, :time_out, :note)
    # rubocop:enable Metrics/LineLength
  end
end
