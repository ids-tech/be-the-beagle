class FlashCard < ActiveRecord::Base
  attr_accessible :back, :front

  belongs_to :flash_deck

  validates :front, presence: true, length: { maximum: 140 }
  validates :back, presence: true, length: { maximum: 140 }
  validates :flash_deck_id, presence: true

  default_scope order: 'flash_cards.created_at DESC'
end
