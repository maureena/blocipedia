class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer  :owner_id
      t.integer  :collaborator_id
      t.integer  :page_id
    end
  end
end
