# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trivia_fact do
    sequence(:question) { |n| "Where does honey come from? #{n}" }
    answer 'Bees make it using nectar from flowers.'
    category
    user
  end
end
