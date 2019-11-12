class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :description
      t.belongs_to :user
      t.belongs_to :movie
      t.timestamps
    end
  end
end
