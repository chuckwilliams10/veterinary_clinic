class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :profiles, :type, :profile_type
  end
end
