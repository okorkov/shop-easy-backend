class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.decimal :total, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2
      t.timestamps
    end
  end
end
