class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :table
      t.string :action
      t.string :field
      t.string :old_value
      t.string :new_value
      t.text :comments
      t.string :user
      t.integer :rel

      t.timestamps
    end
  end
end
