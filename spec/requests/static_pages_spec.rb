require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Be-The-Beagle'" do
      visit '/static_pages/home'
      page.should have_content('Be-The-Beagle')
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end
  end

  describe "Sign In page" do

    it "should have the content 'Be-The-Beagle'" do
      visit '/static_pages/signin'
      page.should have_content('Be-The-Beagle')
    end
  end
end
