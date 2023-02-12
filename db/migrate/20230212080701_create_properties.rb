class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :street_address
      t.string :city
      t.string :country
      t.float :lat
      t.float :long
      t.float :avg_household_income
      t.float :avg_individual_income
      t.float :public_transit_commute_percent
      t.float :walking_commute_percent
      t.float :bike_commute_percent
      t.float :drive_commute_percent
      t.date :last_demo_update

      t.timestamps
    end
  end
end
