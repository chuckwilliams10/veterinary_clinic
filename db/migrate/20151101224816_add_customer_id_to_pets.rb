class AddCustomerIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :customer_id, :integer
  end
end
