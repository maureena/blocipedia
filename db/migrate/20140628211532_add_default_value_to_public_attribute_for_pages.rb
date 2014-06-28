class AddDefaultValueToPublicAttributeForPages < ActiveRecord::Migration
  def up
    change_column_default :pages, :public, true
  end

  def down
    change_column_default :pages, :public, true
  end
end
