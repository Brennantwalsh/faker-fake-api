class Api::V2::StarWarsController < ApplicationController
  def index
    @stars = StarWar.all
  end

  def show
    @star = StarWar.find(params[:id])
  end

  def create
    @star = StarWar.create(
      character: params[:character],
      planet: params[:planet],
      quote: params[:quote]
    )

    render 'show.json.jbuilder'
  end

  def update
    @star = StarWar.find(params[:id])
    @star.character = params[:character] if params[:character]
    @star.planet = params[:planet] if params[:planet]
    @star.quote = params[:quote] if params[:quote]
    @star.save

    render 'show.json.jbuilder'
  end

  def destroy
    @star = StarWar.find(params[:id])
    @star.destroy

    render json: {message: "character is dead"}
  end
end
