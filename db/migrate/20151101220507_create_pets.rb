class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name, limit: 35
      t.string :type
      t.string :breed, limit: 35
      t.integer :age
      t.decimal :weight
      t.datetime :date_last_visit
      t.text :reason

      t.timestamps null: false
    end
  end
end
