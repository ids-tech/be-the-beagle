class AddIndexesToFlashDecks < ActiveRecord::Migration
  def change
    add_index :flash_decks, [:user_id, :created_at]
  end
end
