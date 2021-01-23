class CreateRentalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.boolean :current
    end 
  end
end
