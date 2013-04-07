class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :number
      t.string :complement
      t.string :postal_code
      t.references :home

      t.timestamps
    end
  end
end
