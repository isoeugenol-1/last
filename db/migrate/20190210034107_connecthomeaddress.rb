class Connecthomeaddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :home, foreign_key: true
  end
end
