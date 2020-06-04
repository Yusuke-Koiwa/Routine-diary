class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :category_id, null: false, default: 0
      t.timestamps
    end
  end
end
