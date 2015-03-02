class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status, default: "shopping"
      t.string :name
      t.string :permalink

      t.timestamps null: false
    end
  end
end
