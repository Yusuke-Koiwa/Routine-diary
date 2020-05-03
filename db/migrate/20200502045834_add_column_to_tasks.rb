class AddColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :date, :date
  end
end
