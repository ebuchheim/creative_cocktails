class CLI
    def initialize
        puts "Welcome to Creative Cocktails!"
        puts "What would you like to do?"
        puts "1. Search for a recipe by name"
        puts "2. Browse drinks by ingredient"
        puts "3. Surprise me: random inspiration!"
        user_input = gets.chomp
        if user_input == "1"
            #1 option here
        elsif user_input == "2"
            #2 here
        elsif user_input == "3"
            #3 here
        else
            puts "Sorry, I didn't get that! Please choose an option by entering 1, 2, or 3."
        end
    end
end