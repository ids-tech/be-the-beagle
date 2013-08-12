require 'spec_helper'

describe "Flash Card pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let!(:fd1) { FactoryGirl.create(:flash_deck, user: user, title: "Foo") }
  let!(:fc1) { FactoryGirl.create(:flash_card, flash_deck: fd1, front: "Front 1", back: "Back 1") }
  let!(:fc2) { FactoryGirl.create(:flash_card, flash_deck: fd1, front: "Front 2", back: "Back 2") }

  before { sign_in user }

  describe "flash cards" do
    before { visit flash_deck_path(fd1) }
    it { should have_content(fc1.front) }
    it { should have_content(fc2.front) }
    it { should have_content(fd1.flash_cards.count) }
  end

  describe "flash card creation" do
    before { visit flash_deck_path(fd1) }

    describe "with invalid information" do

      it "should not create a flash card" do
        expect { click_button "Create" }.not_to change(FlashCard, :count)
      end
    end

    describe "with valid information" do

      before { fill_in 'flash_card_front', with: "Front 3" }
      before { fill_in 'flash_card_back', with: "Back 3" }
      it "should create a flash card" do
        expect { click_button "Create" }.to change(FlashCard, :count).by(1)
      end
    end
  end
end
