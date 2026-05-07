class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.text :description
      t.references :column, null: false, foreign_key: true
      t.integer :position, null: false

      t.timestamps
    end

    add_index :cards, [:column_id, :position]
  end
end
