class AddColumnsToVhsAndRentals < ActiveRecord::Migration[5.2]
  def change
      add_column :vhs, :movie_id, :integer
      add_column :rentals, :client_id, :integer
      add_column :rentals, :vhs_id, :integer
  end
end
