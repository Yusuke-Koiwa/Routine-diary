class CreateRoutineLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :routine_logs do |t|
      t.references :task, null: false, foreign_key: true
      t.string :content, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
