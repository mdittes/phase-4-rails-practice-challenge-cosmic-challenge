class PlanetsController < ApplicationController

    def index
        planets = Planet.all 
        render json: planets, status: 200
    end

end
