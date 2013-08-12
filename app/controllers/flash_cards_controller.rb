class FlashCardsController < ApplicationController
  before_filter :signed_in_user

  def index
    @user = current_user
    @flash_deck = FlashDeck.find(cookies[:flash_deck_id])
    @flash_cards = @flash_deck.flash_cards
    @flash_cards = @flash_cards.paginate(page: params[:page], per_page: 15)
    @new_flash_card = @flash_deck.flash_cards.build
  end

  def show
     @flash_card = FlashCard.find(params[:id])
     @user = User.find_by_remember_token(cookies[:remember_token])
  end

  def create
    @flash_deck = FlashDeck.find(cookies[:flash_deck_id])
    @flash_card = @flash_deck.flash_cards.build(params[:flash_card])
    if @flash_card.save
      flash[:success] = "Flash card created!"
      redirect_to index
    else
      flash[:error] = 'Invalid flash card text'
      redirect_to index
    end
  end

end
