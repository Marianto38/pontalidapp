class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :description
      t.string :address
      t.date :open_time
      t.date :close_time

      t.timestamps
    end
  end
end
