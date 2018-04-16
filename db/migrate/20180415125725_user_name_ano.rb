class UserNameAno < ActiveRecord::Migration
  def change
    change_column_default :users, :first_name, 'Anonymous'
  end
end
