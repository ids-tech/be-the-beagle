FactoryGirl.define do
  factory :user do
    name     "Michael Dunnigan"
    email    "msdunnigan@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
