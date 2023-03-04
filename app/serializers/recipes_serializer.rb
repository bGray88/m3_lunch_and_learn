class RecipesSerializer
  def self.recipe(recipe, country)
    {
      "data": recipe_properties(recipe.dig(:hits, 0), country)
    }
  end

  def self.recipes(recipes, country)
    {
      "data": recipes[:hits].map do |recipe|
        recipe_properties(recipe, country)
      end
    }
  end

  def self.recipe_properties(recipe, country)
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
end
