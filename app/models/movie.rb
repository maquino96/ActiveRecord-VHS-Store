class Movie < ActiveRecord::Base
    has_many :movie_genres
    has_many :genres, through: :movie_genres
    has_many :vhs
    # ask how this works
    has_many :rentals, through: :vhs
end 