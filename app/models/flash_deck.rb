class FlashDeck < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user
  has_many :flash_cards, dependent: :destroy

  validates :title, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'flash_decks.created_at DESC'
end
