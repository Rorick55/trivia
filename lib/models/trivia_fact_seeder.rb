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
    if category.include?('TRIVIA') || category.include?('Trivia') && category.length != 1
      category.pop
    end
    category = category.join(' ')
    if ['History', 'American History', 'World History'].include? category
      return 'History'
    elsif ['Animal', 'Nature'].include? category
      return 'Animals and Nature'
    elsif ['American', 'U.S.', 'Cities and States', 'Presidential'].include? category
      return 'America'
    elsif ['Cinema', 'TV', 'Cartoons', 'Movie', 'Cinema and TV'].include? category
      return 'Television and Cinema'
    elsif ['Arts', 'Dance', 'Literature', 'Music'].include? category
      return 'Arts and Literature'
    elsif ['People', 'Famous People'].include? category
      return 'People'
    elsif ['World', 'International'].include? category
      return 'International'
    elsif ['Food', 'Cocktails & Drinks'].include? category
      return 'Food'
    elsif ['Miscellaneous', 'Misc', 'Easy', 'Funny', 'General', 'General Knowledge', 'Harder', 'Kids', 'Business'].include? category
      return 'Miscellaneous'
    elsif ['Language', 'Word'].include? category
      return 'Language'
    elsif ['Stupid Laws', 'Legal'].include? category
      return 'Legal'
    elsif ['Sports', 'International Sports'].include? category
      return 'Sports'
    elsif ['Science', 'Space', 'Medical', 'Human Body'].include? category
      return 'Science'
    else
      return category
    end
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
        if question.length <= 150 && answer.length <= 150
          TriviaFact.find_or_create_by(question: question, answer: answer, category: create_category, featured: true)
        end
      end
    end
  end
end
