class AddHomeUnique < ActiveRecord::Migration[5.1]
  def change
    add_index :homes, :address, unique: true
  end
end
