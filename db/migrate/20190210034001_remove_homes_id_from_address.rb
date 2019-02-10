class RemoveHomesIdFromAddress < ActiveRecord::Migration[5.1]
  def change
    remove_reference :addresses, :homes, foreign_key: true
  end
end
