class SetDefaultNames < ActiveRecord::Migration
  def change
    change_column_default :users, :first_name, 'Unknown'
    change_column_default :users, :last_name, 'User'
  end
end
