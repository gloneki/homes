class CreateHighlightFiles < ActiveRecord::Migration
  def change
    create_table :highlight_files do |t|
      t.string :file
      t.string :description
      t.references :highlight
      t.timestamps
    end
    add_index :highlight_files, :highlight_id
  end
end
