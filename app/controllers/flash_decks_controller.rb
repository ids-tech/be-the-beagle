class FlashDecksController < ApplicationController
  before_filter :signed_in_user

  def index
  end

  def create
    @flash_deck = current_user.flash_decks.build(params[:flash_deck])
    if @flash_deck.save
      flash[:success] = "FlashDeck created!"
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  def destroy
  end
end
