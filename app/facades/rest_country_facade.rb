class RestCountryFacade
  def self.random_country
    Country.new(RestCountryService.countries.sample)
  end

  def self.specific_country(country)
    countries = RestCountryService.countries
    Country.new(countries.find { |api_country| api_country[:name][:common].downcase.include?(country.downcase) })
  end
end
