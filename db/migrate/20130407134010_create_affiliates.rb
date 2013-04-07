class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :name
      t.date :date_affiliate
      t.string :file
      t.string :description
      t.boolean :status
      t.timestamps
    end
  end
end
