class AddColumnsToShoppingCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_cart_items, :image, :string
    add_column :shopping_cart_items, :name, :string
  end
end
