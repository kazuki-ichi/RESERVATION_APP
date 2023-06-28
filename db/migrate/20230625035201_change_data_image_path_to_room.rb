class ChangeDataImagePathToRoom < ActiveRecord::Migration[6.1]
  def up
    change_column :rooms, :image_path, :string
  end
end
