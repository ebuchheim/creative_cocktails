require 'httparty'

class APIService
    def self.fetch_random
        response = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/random.php')
        response.parsed_response["drinks"][0]
        # {
        #     idDrink: "11118",
        #     strDrink: "Blue Margarita",
        #     strCategory: "Ordinary Drink",
        #     strAlcoholic: "Alcoholic",
        #     strGlass: "Cocktail glass",
        #     strIBA: "Contemporary Classics",
        #     strInstructions: "Rub rim of cocktail glass with lime juice. Dip rim in coarse salt. Shake tequila, blue curacao, and lime juice with ice, strain into the salt-rimmed glass, and serve.",
        #     strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/qtvvyq1439905913.jpg",
        #     strIngredient1: "Tequila",
        #     strIngredient2: "Triple sec",
        #     strIngredient3: "Lime juice",
        #     strIngredient4: "Salt",
        #     strIngredient5: "",
        #     strIngredient6: "",
        #     strIngredient7: "",
        #     strIngredient8: "",
        #     strIngredient9: "",
        #     strIngredient10: "",
        #     strIngredient11: "",
        #     strIngredient12: "",
        #     strIngredient13: "",
        #     strIngredient14: "",
        #     strIngredient15: "",
        #     strMeasure1: "1 1/2 oz ",
        #     strMeasure2: "1/2 oz ",
        #     strMeasure3: "1 oz ",
        #     strMeasure4: "",
        #     strMeasure5: "",
        #     strMeasure6: "",
        #     strMeasure7: "",
        #     strMeasure8: "",
        #     strMeasure9: "",
        #     strMeasure10: "",
        #     strMeasure11: "",
        #     strMeasure12: "",
        #     strMeasure13: "",
        #     strMeasure14: "",
        #     strMeasure15: ""
        #     }
    end
end