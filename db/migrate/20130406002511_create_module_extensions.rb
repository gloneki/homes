class CreateModuleExtensions < ActiveRecord::Migration
  def change
    create_table :module_extensions do |t|
      t.string :name
      t.string :description
      t.string :tag_name
      t.boolean :status
      t.boolean :visible
      t.timestamps
    end
  end
end
