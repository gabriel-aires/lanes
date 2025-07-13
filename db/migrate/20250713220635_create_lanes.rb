class CreateLanes < ActiveRecord::Migration[7.2]
  def change
    create_table :lanes do |t|
      t.references :board, null: false, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
