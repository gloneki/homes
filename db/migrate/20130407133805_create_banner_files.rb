class CreateBannerFiles < ActiveRecord::Migration
  def change
    create_table :banner_files do |t|
      t.string :file
      t.string :description
      t.references :banner
      t.timestamps
    end
    add_index :banner_files, :banner_id
  end
end
