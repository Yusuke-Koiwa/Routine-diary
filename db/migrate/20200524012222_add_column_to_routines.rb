class AddColumnToRoutines < ActiveRecord::Migration[5.2]
  def change
    add_column :routines, :category_id, :integer, null: false, default: 0
  end
end
