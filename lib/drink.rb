class Drink
    attr_reader :name, :instructions, :glass, :category, :ingredient1, :measure1,\
    :ingredient2, :measure2, :ingredient3, :measure3, :ingredient4, :measure4,\
    :ingredient5, :measure5, :ingredient6, :measure6, :ingredient7, :measure7,\
    :ingredient8, :measure8, :ingredient9, :measure9, :ingredient10, :measure10,\
    :ingredient11, :measure11, :ingredient12, :measure12, :ingredient13, :measure13,\
    :ingredient14, :measure14, :ingredient15, :measure15, :drinkId

    def initialize(drink)
        @name = drink["strDrink"]
        @drinkId = drink["idDrink"]
        @instructions = drink["strInstructions"]
        @glass = drink["strGlass"]
        @category = drink["strIBA"]
        @ingredient1 = drink["strIngredient1"]
        @measure1 = drink["strMeasure1"]
        @ingredient2 = drink["strIngredient2"]
        @measure2 = drink["strMeasure2"]
        @ingredient3 = drink["strIngredient3"]
        @measure3 = drink["strMeasure3"]
        @ingredient4 = drink["strIngredient4"]
        @measure4 = drink["strMeasure4"]
        @ingredient5 = drink["strIngredient5"]
        @measure5 = drink["strMeasure5"]
        @ingredient6 = drink["strIngredient6"]
        @measure6 = drink["strMeasure6"]
        @ingredient7 = drink["strIngredient7"]
        @measure7 = drink["strMeasure7"]
        @ingredient8 = drink["strIngredient8"]
        @measure8 = drink["strMeasure8"]
        @ingredient9 = drink["strIngredient9"]
        @measure9 = drink["strMeasure9"]
        @ingredient10 = drink["strIngredient10"]
        @measure10 = drink["strMeasure10"]
        @ingredient11 = drink["strIngredient11"]
        @measure11 = drink["strMeasure11"]
        @ingredient12 = drink["strIngredient12"]
        @measure12 = drink["strMeasure12"]
        @ingredient13 = drink["strIngredient13"]
        @measure13 = drink["strMeasure13"]
        @ingredient14 = drink["strIngredient14"]
        @measure14 = drink["strMeasure14"]
        @ingredient15 = drink["strIngredient15"]
        @measure15 = drink["strMeasure15"]
    end

    def display
        puts "Name: #{@name}"
        puts "Glass: #{@glass}"
        puts "Category: #{@category}"
        puts "How do I make this marvelous creation?  First, gather these ingredients:"
        display_ingredients
        puts "Then follow these instructions:"
        puts "#{@instructions}"
    end

    def display_ingredients
        ingredients = {
            @ingredient1 => @measure1,
            @ingredient2 => @measure2,
            @ingredient3 => @measure3,
            @ingredient4 => @measure4,
            @ingredient5 => @measure5,
            @ingredient6 => @measure6,
            @ingredient7 => @measure7,
            @ingredient8 => @measure8,
            @ingredient9 => @measure9,
            @ingredient10 => @measure10,
            @ingredient11 => @measure11,
            @ingredient12 => @measure12,
            @ingredient13 => @measure13,
            @ingredient14 => @measure14,
            @ingredient15 => @measure15
        }
        ingredients.each do |ingredient, measure|
            if ingredient != "" && !!ingredient
                if measure != "" && measure
                    puts " - #{measure.strip} #{ingredient}"
                else
                    puts " - #{ingredient}"
                end
            end
        end
    end
end