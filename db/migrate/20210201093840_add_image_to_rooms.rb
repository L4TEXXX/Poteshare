class AddImageToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :images, :string
  end
end
