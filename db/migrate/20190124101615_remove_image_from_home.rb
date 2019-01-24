class RemoveImageFromHome < ActiveRecord::Migration[5.1]
  def change
    remove_column :homes, :image, :text
  end
end
