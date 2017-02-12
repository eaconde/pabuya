class AddApprovedAtToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :approved_at, :datetime
  end
end
