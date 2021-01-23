class RenameMgToMovieGenres < ActiveRecord::Migration[5.2]
  def change
    rename_table :moviegenres, :movie_genres 
  end
end
