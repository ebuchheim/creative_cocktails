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
        #search the api
        puts "Here's what I found for #{user_input} recipes:"
    end

    def drinks_by_ingredient
        puts "What ingredient did you have in mind?"
        user_input = gets.chomp
        #search the api
        puts "These drinks all include #{user_input}:"
    end

    def random_drink
        #search the api
        puts "Let me tell you about..."
    end
end