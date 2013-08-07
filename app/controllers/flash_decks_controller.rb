class FlashDecksController < ApplicationController
  before_filter :signed_in_user

  def show
     @user = User.find_by_remember_token(cookies[:remember_token])
     @flash_deck = FlashDeck.find(params[:id])
  end

  def index
    @user = current_user
    @flash_decks = @user.flash_decks.paginate(page: params[:page], per_page: 15)
    @new_flash_deck = @user.flash_decks.build
  end

  def create
    @flash_deck = current_user.flash_decks.build(params[:flash_deck])
    if @flash_deck.save
      flash[:success] = "FlashDeck created!"
      redirect_to index
    else
      flash[:error] = 'Invalid flash deck title'
      redirect_to index
    end
  end

  def destroy
  end
end
