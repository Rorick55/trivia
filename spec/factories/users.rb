# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Rory'
    last_name 'Team'
    sequence(:username) { |n| "Rorick#{n}" }
    sequence(:email) { |n| "#{n}email@gmail.com"}
    password 'password'
    password_confirmation 'password'
  end
end
