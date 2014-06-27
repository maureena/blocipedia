class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.text :body
      t.references :page, index: true

      t.timestamps
    end
  end
end
