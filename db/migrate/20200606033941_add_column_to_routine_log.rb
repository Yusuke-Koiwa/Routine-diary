class AddColumnToRoutineLog < ActiveRecord::Migration[5.2]
  def change
    add_reference :routine_logs, :category, foreign_key: true
  end
end
