class AddColumnsToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :created_at, :string
    add_column :rentals, :updated_at, :string 
  end
end
