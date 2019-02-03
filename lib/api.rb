require 'httparty'

class APIService
    def self.fetch_random
        response = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/random.php')
        response.parsed_response["drinks"][0]
    end

    def self.search_by_name(name)
        link = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=" + name
        response = HTTParty.get(link)
        response.parsed_response["drinks"][0]
    end
end