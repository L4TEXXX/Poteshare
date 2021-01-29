class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_PR
      t.integer :room_price
      t.datetime :start_day
      t.datetime :finish_day
      t.datetime :room_addres

      t.timestamps
    end
  end
end
