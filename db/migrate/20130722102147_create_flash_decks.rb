class CreateFlashDecks < ActiveRecord::Migration
  def change
    create_table :flash_decks do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
