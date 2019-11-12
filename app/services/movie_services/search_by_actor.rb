module MovieServices
  class SearchByActor
    def self.call(params)
      Movie.includes(:reviews, :actors, :director).joins(:actors).where('actors.name LIKE ?', "%#{params[:by_actor_name]}%")
    end
  end
end