class Movie < ActiveRecord::Base
    has_many :movie_genres
    has_many :genres, through: :movie_genres
    has_many :vhs
    # ask how this works
    has_many :rentals, through: :vhs

    def self.available_now
        # Rental.all.select{|rental| rental.current == false }
        # misunderstood directions, asking for available vhs tapes?
    end
    
    def self.longest
        Movie.all.sort { |a, b| b.length <=> a.length}
    end 

    def self.surprise_me
        recommendation = Movie.all[rand(0..Movie.all.length-1)]
        "Your movie recommendation is \"#{recommendation.title},\" directed by #{recommendation.director}.\nIt was released in #{recommendation.year} and has a feature length of #{recommendation.length} minutes."
    end
    
    def report_stolen
        vhs_array = Vhs.all.select{ |vhs| vhs.movie_id == self.id}
        vhs_array[rand(0..vhs_array.length-1)].destroy 
    end 
end 