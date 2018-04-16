class ChangeAccomColName < ActiveRecord::Migration
  def change
    rename_column :accommodations, :type, :accom_type
  end
end
