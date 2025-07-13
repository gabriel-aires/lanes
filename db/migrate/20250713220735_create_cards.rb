class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.references :lane, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :position
      t.datetime :archived_at

      t.timestamps
    end
  end
end
