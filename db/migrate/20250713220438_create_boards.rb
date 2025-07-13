class CreateBoards < ActiveRecord::Migration[7.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :color

      t.timestamps
    end
  end
end
