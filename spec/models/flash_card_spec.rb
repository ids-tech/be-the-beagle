require 'spec_helper'

describe FlashCard do

  let!(:user) { FactoryGirl.create(:user) }
  before { 
    @flash_deck = user.flash_decks.build(title: "Test Deck")
    @flash_deck.save
    @flash_card = @flash_deck.flash_cards.build(front: "Front text", back: "Back text") 
  }

  subject { @flash_card }

  it { should respond_to(:front) }
  it { should respond_to(:back) }
  it { should respond_to(:flash_deck_id) }
  it { should respond_to(:flash_deck) }
  its(:flash_deck) { should == @flash_deck }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow acces to flash_deck_id" do
      expect do
        FlashCard.new(flash_deck_id: @flash_deck.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when flash_deck_id is not present" do
    before { @flash_card.flash_deck_id = nil }
    it { should_not be_valid }
  end

  describe "with blank front" do
    before { @flash_card.front = " " }
    it { should_not be_valid }
  end

  describe "with blank front" do
    before { @flash_card.back = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @flash_card.front = "a" * 501 }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @flash_card.back = "a" * 501 }
    it { should_not be_valid }
  end
end
