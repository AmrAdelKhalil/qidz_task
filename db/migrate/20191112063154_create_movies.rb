class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.integer :year
      t.string :film_location
      t.string :country
      t.belongs_to :director
      t.timestamps
    end
  end
end
