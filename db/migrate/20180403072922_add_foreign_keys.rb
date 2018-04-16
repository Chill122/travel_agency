class AddForeignKeys < ActiveRecord::Migration
  def change
    add_reference :reservations, :user, index: true, foreign_key: true
    add_reference :reservations, :offer, index: true, foreign_key: true
    add_reference :comments, :user, index: true, foreign_key: true
    add_reference :comments, :offer, index: true, foreign_key: true
    add_reference :offers, :accommodation, index: true, foreign_key: true
    add_reference :accommodations, :place, index: true, foreign_key: true
    add_reference :places, :country, index: true, foreign_key: true
  end
end
