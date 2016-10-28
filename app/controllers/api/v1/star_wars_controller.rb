class Api::V1::StarWarsController < ApplicationController
  def index
    @stars = StarWar.all
  end

  def show
    @star = StarWar.find(params[:id])
  end

  def create
    @star = StarWar.new(
      character: params["character"],
      planet: params["planet"],
      quote: params["quote"]
    )
    if @star.save
      redirect_to "/api/v1/star_wars/#{@star.id}.json"
    else
      render json: {errors: @star.errors.full_messages}, status: 422
    end
  end

  def update
    @star = StarWar.find(params[:id])
    @star.character = params["character"] if params[:character]
    @star.planet = params["planet"] if params[:planet]
    @star.quote = params["quote"] if params[:quote]
    @star.save

    redirect_to "api/v1/employees/#{@star.id}.json"
  end

  def destroy
    @star = StarWar.find(params[:id])
    @star.destroy

    render json: {message: "character is dead"}
  end
end
