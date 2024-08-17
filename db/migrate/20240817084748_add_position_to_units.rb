class AddPositionToUnits < ActiveRecord::Migration[7.2]
  def change
    add_column :units, :position, :integer
  end
end
