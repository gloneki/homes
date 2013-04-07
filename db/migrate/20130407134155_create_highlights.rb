class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :name

      t.timestamps
    end
  end
end
