class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.references :area, foreign_key: true
      t.string :razon_social
      t.string :cuit
      t.string :titular
      t.string :email
      t.string :telefono
      t.string :celular

      t.timestamps
    end
  end
end
