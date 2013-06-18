FactoryGirl.define do
  factory :user do
    name     "Luc"
    email    "dalu@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end