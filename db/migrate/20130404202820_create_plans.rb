class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :code
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
