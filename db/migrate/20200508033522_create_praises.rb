class CreatePraises < ActiveRecord::Migration[5.2]
  def change
    create_table :praises do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
      t.index [:task_id, :user_id], unique: true
    end
  end
end
