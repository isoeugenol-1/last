class Addcolmn < ActiveRecord::Migration[5.1]
  def change
    add_column :homes, :latitude, :float
    add_column :homes, :longitude, :float
    add_column :homes, :image, :json
  end
end
