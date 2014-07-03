# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trivia_fact do
    question 'Where does honey come from?'
    answer 'Bees make it using nectar from flowers.'
    category
  end
end
