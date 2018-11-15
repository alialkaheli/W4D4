class AddUseridToBand < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :user_id, :integer
  end
end
