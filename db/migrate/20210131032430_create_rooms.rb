class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_PR
      t.integer :room_price
      t.datetime :start_day
      t.datetime :finish_day
      t.string :room_address
      t.references :user, null: false, foreign_key: true  

      t.timestamps
    end
  end
end
