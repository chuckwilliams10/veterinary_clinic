class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :visit_date
      t.integer :pet_id
      t.boolean :reminder
      t.text :visit_reason
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end
