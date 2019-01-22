class RemoveIconFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :icon, :text
  end
end
