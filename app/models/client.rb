class Client < ActiveRecord::Base
    has_many :rentals
    has_many :vhs, through: :rentals

    def rentals
        # helper method
        Rental.all.select{|rental| rental.client_id == self.id}
    end 

    def return_one(vhs)
        # needed a variable in order to update the database.
        #find and find_by can only be applied to tables
        user = Rental.all.find_by(current: true, vhs_id: vhs.id)
        user.current = false
        user.save
    end 

    def last_return
        rentals.each{|rental| 
            rental.current = false
            rental.save}
        self.destroy
    end 

    def paid
        # helper method
        cost = 0
        rentals.each{ |rental|
            if rental.current == true 
                cost+=0
            else 
                (rental.updated_at.to_date - rental.created_at.to_date) > 7 ?  cost+= 12 : cost+= 5.35
            end 
        }
        cost 
    end 

    def self.paid_most
        user = nil
        fee = 0
        # all.map(&:paid).sort[all.length-1] (only returns the cost, no instance / name)
        all.each{ |client| 
            if client.paid > fee
                user = client.name 
                fee = client.paid
            end 
        }
        # if we want the client instance => Client.all.find_by(name: user)
        "#{user} owes $#{fee}"
    end 

end