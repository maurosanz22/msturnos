class AlterTableShift < ActiveRecord::Migration[5.0]
  def change
  	remove_column :shifts, :shift_type_id
  	remove_column :shifts, :decha
  	remove_column :shifts, :hora_inicio
  	remove_column :shifts, :hora_fin
    add_column :shifts, :fecha, :datetime
    add_column :shifts, :hora_inicio, :datetime
    add_column :shifts, :hora_fin, :datetime
  end
end
