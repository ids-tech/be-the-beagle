class CreateFlashCards < ActiveRecord::Migration
  def change
    create_table :flash_cards do |t|
      t.integer :flash_deck_id
      t.string :front
      t.string :back

      t.timestamps
    end

    add_index :flash_cards, [:flash_deck_id, :created_at]
  end
end
