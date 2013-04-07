class CreateTypeHomes < ActiveRecord::Migration
  def change
    create_table :type_homes do |t|
      t.string :name
      t.string :tag

      t.timestamps
    end
  end
end
