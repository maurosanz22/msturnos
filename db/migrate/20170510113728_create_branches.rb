class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
