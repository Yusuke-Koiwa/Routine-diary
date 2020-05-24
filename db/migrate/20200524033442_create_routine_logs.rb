class CreateRoutineLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :routine_logs do |t|
      t.references :task, null: false, foreign_key: true
      t.integer :category_id, null: false, default: 0
      t.string :content, null: false
      t.timestamps
    end
  end
end
