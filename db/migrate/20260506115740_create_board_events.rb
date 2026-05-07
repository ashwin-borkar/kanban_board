class CreateBoardEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :board_events do |t|
      t.string :event_type, null: false
      t.references :card, null: false, foreign_key: true
      t.references :column_from, foreign_key: { to_table: :columns }
      t.references :column_to, foreign_key: { to_table: :columns }
      t.integer :old_position
      t.integer :new_position
      t.string :old_title
      t.string :new_title
      t.text :old_description
      t.text :new_description
      t.datetime :timestamp, null: false

      t.timestamps
    end

    add_index :board_events, :timestamp
    add_index :board_events, :event_type
    add_index :board_events, [:card_id, :timestamp]
  end
end
