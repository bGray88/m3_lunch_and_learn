class RecipeFacade
  def self.recipes(country)
    country = RestCountryFacade.random_country.name if country.blank?
    recipes = EdamamService.search_by_name(country)
    return CommonsSerializer.empty if recipes[:hits].empty?
    RecipesSerializer.recipes(recipes, country)
  end
end
