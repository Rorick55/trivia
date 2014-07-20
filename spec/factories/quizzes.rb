# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    trivia_questions [100, 500, 600, 700, 800, 900, 270, 1000, 508, 409, 672, 567]
  end
end
