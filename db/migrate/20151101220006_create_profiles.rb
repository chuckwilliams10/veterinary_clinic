class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name, limit: 35
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :school
      t.integer :years_practice
      t.string :type

      t.timestamps null: false
    end
  end
end
