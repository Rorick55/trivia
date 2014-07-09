require 'open-uri'

class TriviaFactSeeder
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
  end

  def category
    location = @doc.css('.location').text
    category_with_num = location.split('>').pop
    category = category_with_num.split(' ')
    category.pop
    if category.include?('TRIVIA') || category.include?('Trivia')
      category.pop
    end
    category = category.join(' ')
  end

  def create_category
    Category.find_or_create_by!(name: category)
  end

  def create_stack
    @doc.css('p').each do |item|
      if item.text.include?('A:')
        ques_ans_array = item.text.split('A:')
        question = ques_ans_array[0].split.join(' ')
        answer = ques_ans_array[1].split.join(' ')
        TriviaFact.find_or_create_by(question: question, answer: answer, category: create_category, featured: true)
      end
    end
  end
end
