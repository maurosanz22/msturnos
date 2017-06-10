class CreateShiftTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :shift_types do |t|
      t.references :branch, foreign_key: true
      t.string :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
