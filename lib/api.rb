require 'httparty'

class APIService
    def self.fetch_random
        response = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/random.php')
        response.parsed_response["drinks"][0]
    end

    def self.search_by_name(name)
        link = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=" + name
        response = HTTParty.get(link)
        response.parsed_response["drinks"]
    end

    def self.search_by_ingredient(ingredient)
        link = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=" + ingredient
        response = HTTParty.get(link)
        if response.parsed_response != nil
            response.parsed_response["drinks"]
        else
            nil
        end
    end

    def self.search_by_id(drink_id)
        link = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=" + drink_id
        response = HTTParty.get(link)
        response.parsed_response["drinks"][0]
    end
end