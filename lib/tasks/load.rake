require 'csv'

namespace :load do
  desc 'Load movies from CSV file'
  task movies: :environment do
    csv_text = File.read("#{Rails.root}/public/movies.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash
      actor = Actor.find_or_create_by!(name: row['Actor'])
      director = Director.find_or_create_by!(name: row['Director'])
      movie = Movie.find_by(name: row['Movie'])
      movie = Movie.create!(
        name: row['Movie'],
        description: row['Description'],
        year: row['Year'].to_i,
        film_location: row['Filming location'],
        country: row['Country'],
        director: director
      ) if !movie
      movie.actors << actor
    end
  end

  desc 'Load reviews from CSV file'
  task reviews: :environment do
    csv_text = File.read("#{Rails.root}/public/reviews.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash
      user = User.find_or_create_by!(name: row['User'])
      movie = Movie.find_by(name: row['Movie'])
      Review.create!(movie: movie, user: user, stars: row['Stars'], description: row['Review']) if movie
    end
  end

  desc 'RUN THEM ALL'
  task :run_all => [:movies, :reviews] do
    puts 'Finished loading data'
  end
end
