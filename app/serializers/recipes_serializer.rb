class RecipesSerializer
  def self.recipes(recipes, country)
    {
      "data": recipes[:hits].map do |recipe|
        {
          "id":   nil,
          "type": "recipe",
          "attributes": {
            "title":   recipe.dig(:recipe, :label),
            "url":     recipe.dig(:recipe, :url),
            "country": country,
            "image":   recipe.dig(:recipe, :image)
          }
        }
      end
    }
  end
end
