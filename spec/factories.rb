FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :flash_deck do
    title "Test flash deck"
    user
  end

  factory :flash_card do
    front "Flash card front"
    back "Flash card back"
    flash_deck
  end
end
