class ActorMoviesController < ApplicationController
  def new
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Move.find(params[:id])
    @actor = @movie.actors.create!(actor_params)
    @actor.save
    # redirect_to "/movies/#{@move.id}"
  end

  private
    def actor_params
      params.permit(:name, :age)
    end 
end
