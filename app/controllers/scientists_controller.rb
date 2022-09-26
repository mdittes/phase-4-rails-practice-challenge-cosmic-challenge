class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        scientists = Scientist.all 
        render json: scientists
    end

    def show
        scientist = Scientist.find(params[:id])
        render json: scientist, status: :ok, serializer: ScientistsWithPlanetsSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: 202
    end

    def destroy
        scientist = Scientist.find(params[:id])
        scientist.destroy
        head :no_content
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def render_not_found
        render json: {error: "Scientist not found"}, status: :not_found
    end

end
