# frozen_string_literal: true

# ClearancesController
class ClearancesController < ApplicationController
  before_action :set_clearance, only: %i[show update destroy]

  # GET /clearances
  def index
    @clearances = Clearance.all

    render json: @clearances
  end

  # GET /clearances/1
  def show
    render json: @clearance
  end

  # POST /clearances
  def create
    @clearance = Clearance.new(clearance_params)

    if @clearance.save
      render json: @clearance, status: :created, location: @clearance
    else
      render json: @clearance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clearances/1
  def update
    if @clearance.update(clearance_params)
      render json: @clearance
    else
      render json: @clearance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clearances/1
  def destroy
    @clearance.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_clearance
    @clearance = Clearance.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def clearance_params
    params.require(:clearance).permit(:agency_id, :user_id)
  end
end
