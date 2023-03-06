class RestCountryFacade
  def self.random_country
    Country.new(RestCountryService.country.sample)
  end

  def self.specific_country(country)
    binding.pry
    ""
  end
end
