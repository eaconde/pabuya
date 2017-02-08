class AddAttrToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_range, :string, default: 'monthly'
    add_column :events, :range_max_points, :integer, default: 2
  end
end
