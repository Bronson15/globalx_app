class AddColumnsToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :name, :string
    add_column :trips, :start_date, :date
    add_column :trips, :end_date, :date
    add_column :trips, :location, :string
  end
end
