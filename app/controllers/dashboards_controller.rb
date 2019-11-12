class DashboardsController < ApplicationController
  def index
    @movies = Movie.all
  end
end
