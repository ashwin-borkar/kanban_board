class CreateColumns < ActiveRecord::Migration[8.1]
  def change
    create_table :columns do |t|
      t.string :name, null: false
      t.integer :position, null: false

      t.timestamps
    end

    add_index :columns, :position
  end
end
