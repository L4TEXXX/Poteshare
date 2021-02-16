class AddColumnIntro < ActiveRecord::Migration[6.1]
  def change
    add_column :users,:intro,:string
  end
end
