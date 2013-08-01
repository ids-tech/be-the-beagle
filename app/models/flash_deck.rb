class FlashDeck < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user

  validates :title, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'flash_decks.created_at DESC'
end
