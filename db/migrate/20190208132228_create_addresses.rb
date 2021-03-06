class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.references :homes, foreign_key: true
      t.timestamps
    end
  end
end
