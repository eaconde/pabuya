class AddApprovedToCartDetails < ActiveRecord::Migration
  def change
    add_column :cart_details, :approved, :boolean, default: false
  end
end
