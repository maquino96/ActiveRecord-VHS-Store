class Rental < ActiveRecord::Base
    belongs_to :client
    belongs_to :vhs 

    def due_date
        # used the example in the seed file to return a data type of 'date' that was 7 days from the date created.
        self.created_at.to_date + 7.days 
    end 

    def self.past_due_date
        all.select{ |rental| (rental.updated_at.to_date - rental.created_at.to_date) > 7}
    end 
end 

