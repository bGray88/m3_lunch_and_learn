class RecipeFacade
  def self.recipe(country)
    country = RestCountryFacade.random_country.name unless country
    [EdamamService.search_by_name(country), country]
  end
end
