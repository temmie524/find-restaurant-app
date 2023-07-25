class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.integer :id
      t.string :name
      t.string :address
      t.string :open
      t.string :close
      t.string :logo_pic
      t.string :station
      t.boolean :ktai_coupon
      t.string :photo_url

      t.timestamps
    end
  end
end
