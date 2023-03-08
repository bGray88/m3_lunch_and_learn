class RecipeFacade
  def self.recipes(country)
    valid_country = CountryFacade.country_validate(country) if country.present?
    return valid_country if valid_country.is_a?(SearchError)
    country = CountryFacade.random_country.name if country.nil?
    search_recipes = RecipesService.search_by_name(country)
    return CommonsSerializer.empty if search_recipes[:hits].empty?
    RecipesSerializer.recipes(search_recipes[:hits].map { |recipe| Recipe.new(recipe) }, country)
  end
end
