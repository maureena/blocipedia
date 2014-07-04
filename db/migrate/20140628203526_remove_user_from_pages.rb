class RemoveUserFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :user_id, :integer
  end
end
