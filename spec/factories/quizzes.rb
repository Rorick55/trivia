# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    trivia_questions [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  end
end
