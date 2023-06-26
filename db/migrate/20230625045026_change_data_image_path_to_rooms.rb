class ChangeDataImagePathToRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :image_path, :string
  end
end
