class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :title
      t.string :type
      t.string :address
      t.integer :rating
      t.text :description

      t.timestamps null: false
    end
  end
end
