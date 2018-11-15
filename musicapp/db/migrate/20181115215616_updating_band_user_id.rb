class UpdatingBandUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :bands, :user_id
    add_column :bands, :user_id, :integer, null: false
  end
end
