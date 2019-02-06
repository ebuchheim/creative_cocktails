class CLI
    def initialize
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Welcome to Creative Cocktails!"
        puts "What would you like to do?"
        puts "  1. Search for a recipe by name"
        puts "  2. Browse drinks by ingredient"
        puts "  3. Surprise me: random inspiration!"
        user_input = gets.chomp
        if user_input == "1"
            drinks_by_name
        elsif user_input == "2"
            drinks_by_ingredient
        elsif user_input == "3"
            random_drink
        else
            puts "Sorry, I didn't get that! Please choose an option by entering 1, 2, or 3."
            CLI.new
        end
    end

    def drinks_by_name
        puts "What drink did you have in mind?"
        user_input = gets.chomp
        search_results = APIService.search_by_name(user_input)
        if search_results != nil
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "I found these recipes for #{user_input}:"
            counter = 1
            drink_results = search_results.map do |result|
                drink = Drink.new(result)
                puts "  #{counter}. #{drink.name}"
                counter += 1
                drink
            end
            drink_display(drink_results)
        else
            puts "Sorry, I don't have any #{user_input} drinks."
            puts "Want to search again? Please enter (y)es or (n)o."
            user_answer = gets.chomp
            if user_answer == "n"
                main_or_quit
            elsif user_answer == "y"
                drinks_by_name
            end
        end
    end

    def drink_display(drink_results)
        puts "Select a drink to learn more about it!"
        puts "Or enter 0 to return to the main menu."
        user_selection = gets.chomp
        total = drink_results.count
        user_selection = user_selection.to_i
        if user_selection >= 1 && user_selection <= total
            index = user_selection - 1
            drink_to_show = drink_results[index]
            drink = APIService.search_by_id(drink_to_show.drinkId)
            drink = Drink.new(drink)
            drink.display
            back_main_or_quit(drink_results)
        elsif user_selection == 0
            CLI.new
        else
            puts "Sorry, please choose a number from the list above."
        end
    end

    def drinks_by_ingredient
        puts "What ingredient did you have in mind?"
        user_input = gets.chomp
        search_results = APIService.search_by_ingredient(user_input)
        if search_results != nil
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "These drinks all include #{user_input}."
            counter = 1
            drink_results = search_results.map do |result|
                drink = Drink.new(result)
                puts "  #{counter}. #{drink.name}"
                counter += 1
                drink
            end
            drink_display(drink_results)
        else
            puts "Sorry, I don't have any #{user_input} drinks."
            puts "Want to search again? Please enter (y)es or (n)o."
            user_answer = gets.chomp
            if user_answer == "n"
                main_or_quit
            elsif user_answer == "y"
                drinks_by_ingredient
            end
        end
    end

    def random_drink
        drink = APIService.fetch_random
        selection = Drink.new(drink)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Let me tell you about #{selection.name}!"
        selection.display
        puts "If you'd like to see another random recipe, press 1!"
        puts "Enter 0 to return to the main menu."
        puts "Enter q to quit the program."
        user_input = gets.chomp
        if user_input == "1"
            random_drink
        elsif user_input == "0"
            CLI.new
        elsif user_input == "q"
            puts "Good bye!"
        end
    end

    def back_main_or_quit(drink_results)
        puts "Enter b to go back to the previous list."
        puts "Enter 0 to return to the main menu."
        puts "Enter q to quit the program."
        user_input = gets.chomp
        if user_input == "0"
            CLI.new
        elsif user_input == "b"
            counter = 1
            drink_results.each do |drink|
                puts "  #{counter}. #{drink.name}"
                counter += 1
            end
            drink_display(drink_results)
        elsif user_input == "q"
            puts "Good bye!"
        else
            puts "Sorry, I didn't get that."
            back_main_or_quit(drink_results)
        end
    end

    def main_or_quit
        puts "Enter 0 to return to the main menu."
        puts "Enter q to quit the program."
        user_input = gets.chomp
        if user_input == "0"
            CLI.new
        elsif user_input == "q"
            puts "Good bye!"
        else
            puts "Sorry, I didn't get that."
            main_or_quit
        end 
    end
end