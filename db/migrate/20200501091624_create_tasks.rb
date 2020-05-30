class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :score
      t.string :body
      t.date :date, null: false
      t.datetime :start_time, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :tasks, :score
  end
end
