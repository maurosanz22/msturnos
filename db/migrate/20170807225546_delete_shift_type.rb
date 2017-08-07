class DeleteShiftType < ActiveRecord::Migration[5.0]
  def change
  	drop_table :shift_types
  end
end
