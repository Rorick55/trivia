class CategorySeeder
  CATEGORIES = %w(History Animals Science Math Culture)

  def self.seed!
    CATEGORIES.each do |category|
      puts "Create Category: #{category}"
      Category.find_or_create_by!(name: category)
    end
  end
end