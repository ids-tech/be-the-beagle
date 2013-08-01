require 'spec_helper'

describe FlashDeck do

  let(:user) { FactoryGirl.create(:user) }
  before { @flash_deck = user.flash_decks.build(title: "Test Deck") }

  subject { @flash_deck }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        FlashDeck.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @flash_deck.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @flash_deck.title = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @flash_deck.title = "a" * 141 }
    it { should_not be_valid }
  end
end
