# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_response do
    answer1 'yes'
    answer2 'yes'
    answer3 'yes'
    answer4 'yes'
    answer5 'yes'
    answer6 'yes'
    answer7 'yes'
    answer8 'yes'
    answer9 'yes'
    answer10 'yes'
    answer11 'yes'
    answer12 'yes'
    user
    quiz
  end
end
