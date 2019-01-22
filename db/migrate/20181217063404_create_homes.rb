class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.text :home
      t.decimal :sikikinn
      t.decimal :reikinn
      t.decimal :space
      t.text :image
      t.text :area
      t.decimal :price
      t.text :address
      t.text :ldk
      t.timestamps
    end
  end
end
