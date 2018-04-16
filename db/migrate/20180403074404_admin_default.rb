class AdminDefault < ActiveRecord::Migration
  def change
    change_column_null :users, :admin, false
    change_column_default :users, :admin, '0'
  end
end
