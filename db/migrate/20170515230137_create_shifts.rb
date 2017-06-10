class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.references :shift_type, foreign_key: true
      t.references :activity, foreign_key: true
      t.datetime :decha
      t.string :hora_inicio
      t.string :hora_fin

      t.timestamps
    end
  end
end
