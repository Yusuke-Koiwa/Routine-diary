class AddRoutineColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :routine1, :string
    add_column :tasks, :routine2, :string
    add_column :tasks, :routine3, :string
  end
end
