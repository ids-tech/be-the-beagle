require 'spec_helper'

describe "Flash Deck pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "flash deck creation" do
    before { visit user_path(user) }

    describe "with invalid information" do

      it "should not create a flash deck" do
        expect { click_button "Create" }.not_to change(FlashDeck, :count)
      end
    end

    describe "with valid information" do

      before { fill_in 'flash_deck_title', with: "Lorem ipsum" }
      it "should create a flash deck" do
        expect { click_button "Create" }.to change(FlashDeck, :count).by(1)
      end
    end
  end
end
