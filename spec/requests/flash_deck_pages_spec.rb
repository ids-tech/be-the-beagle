require 'spec_helper'

describe "Flash Deck pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let!(:m1) { FactoryGirl.create(:flash_deck, user: user, title: "Foo") }
  let!(:m2) { FactoryGirl.create(:flash_deck, user: user, title: "Bar") }

  before { sign_in user }

  describe "flash decks" do
    before { visit flash_decks_path }
    it { should have_content(m1.title) }
    it { should have_content(m2.title) }
    it { should have_content(user.flash_decks.count) }
  end

  describe "flash deck creation" do
    before { visit flash_decks_path }

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
