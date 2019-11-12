class MoviesController < ApplicationController
  def search
    @movies = MovieServices::SearchByActor.call(search_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def search_params
    params.permit(:by_actor_name)
  end
end
