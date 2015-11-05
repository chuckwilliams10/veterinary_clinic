class AddProfileIdToPet < ActiveRecord::Migration
  def change
    add_column :pets, :profile_id, :integer
  end
end
