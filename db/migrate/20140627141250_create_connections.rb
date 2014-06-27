class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer  :editor_id
      t.integer  :page_id
    end
  end
end
