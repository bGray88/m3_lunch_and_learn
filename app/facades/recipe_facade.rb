class RecipeFacade
  def self.recipes(country)
    country = RestCountryFacade.random_country.name if country.nil?
    search_recipes = EdamamService.search_by_name(country)
    return CommonsSerializer.empty if search_recipes[:hits].empty?
    RecipesSerializer.recipes(search_recipes[:hits].map { |recipe| Recipe.new(recipe) }, country)
  end
end
