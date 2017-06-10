class CreateSearchManagementShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :search_management_shifts do |t|
      t.integer :branch_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
