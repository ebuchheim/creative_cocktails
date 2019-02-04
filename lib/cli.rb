class CLI
    def initialize
        puts "Welcome to Creative Cocktails!"
        puts "What would you like to do?"
        puts "1. Search for a recipe by name"
        puts "2. Browse drinks by ingredient"
        puts "3. Surprise me: random inspiration!"
        user_input = gets.chomp
        if user_input == "1"
            drinks_by_name
        elsif user_input == "2"
            drinks_by_ingredient
        elsif user_input == "3"
            random_drink
        else
            puts "Sorry, I didn't get that! Please choose an option by entering 1, 2, or 3."
        end
    end

    def drinks_by_name
        puts "What drink did you have in mind?"
        user_input = gets.chomp
        seach_results = APIService.search_by_name(user_input)
        puts "Here's what I found for #{user_input} recipes."
        counter = 1
        drink_results = seach_results.map do |result|
            drink = Drink.new(result)
            puts "#{counter}. #{drink.name}"
            counter += 1
            drink
        end
        drink_display(drink_results)
    end

    def drink_display(drink_results)
        puts "Select a drink to learn more about it!"
        user_selection = gets.chomp
        total = drink_results.count
        user_selection = user_selection.to_i
        if user_selection >= 1 && user_selection <= total
            index = user_selection - 1
            drink_to_show = drink_results[index]
            if drink_to_show.glass != nil
                drink_to_show.display
            else #do stuff
                drink = APIService.search_by_id(drink_to_show.drinkId)
                drink = Drink.new(drink)
                drink.display
            end
        else
            puts "Sorry, please choose a number from the list above."
        end
    end

    def drinks_by_ingredient
        puts "What ingredient did you have in mind?"
        user_input = gets.chomp
        seach_results = APIService.search_by_ingredient(user_input)
        puts "These drinks all include #{user_input}."
        puts "Select a drink to learn more about it!"
        counter = 1
        drink_results = seach_results.map do |result|
            drink = Drink.new(result)
            puts "#{counter}. #{drink.name}"
            counter += 1
            drink
        end
        drink_display(drink_results)
    end

    def random_drink
        drink = APIService.fetch_random
        selection = Drink.new(drink)
        puts "Let me tell you about #{selection.name}"
        selection.display
    end
end