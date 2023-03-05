class RestCountryFacade
  def self.random_country
    Country.new(RestCountryService.random_country)
  end
end
