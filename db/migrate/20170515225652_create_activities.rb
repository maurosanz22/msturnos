class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :branch, foreign_key: true
      t.string :Nombre
      t.integer :cupo
      t.integer :duracion_minutos

      t.timestamps
    end
  end
end
