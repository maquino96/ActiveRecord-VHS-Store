class AddColumnsToMovieGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_genres, :movie_id, :integer
    add_column :movie_genres, :genre_id, :integer
  end
end
