class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
