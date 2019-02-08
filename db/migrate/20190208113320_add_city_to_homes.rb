class AddCityToHomes < ActiveRecord::Migration[5.1]
  def change
    add_column :homes, :city, :string
    add_column :homes, :state, :string
    add_column :homes, :country, :string
    add_column :homes, :postcode, :string
  end
end
