class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :score
      t.string :body
      t.datetime :start_time

      t.timestamps
    end
    add_index :tasks, :score
  end
end
