class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:id])
    @actor = @movie.actors.create!(actor_params)
    @actor.save
    # redirect_to "/movies/#{@move.id}"
  end

  private
    def actor_params
      params.permit(:name, :age)
    end
end
