class AddPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :position, :string
    add_column :users, :position_start, :datetime
    add_column :users, :position_end, :datetime
  end
end
