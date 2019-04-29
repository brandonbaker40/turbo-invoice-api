# frozen_string_literal: true

# DisciplinesController
module Api::V1
  class DisciplinesController < ApplicationController
    before_action :set_discipline, only: %i[show update destroy]
    # before_action :authenticate_user

    # GET /disciplines
    def index
      @disciplines = Discipline.all

      render json: @disciplines
    end

    # GET /disciplines/1
    def show
      render json: @discipline
    end

    # POST /disciplines
    def create
      @discipline = Discipline.new(discipline_params)

      if @discipline.save
        render json: @discipline, status: :created, location: @discipline
      else
        render json: @discipline.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /disciplines/1
    def update
      if @discipline.update(discipline_params)
        render json: @discipline
      else
        render json: @discipline.errors, status: :unprocessable_entity
      end
    end

    # DELETE /disciplines/1
    def destroy
      @discipline.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def discipline_params
      params.require(:discipline).permit(:name, :field, :job_title, :abbreviation)
    end
  end
end
