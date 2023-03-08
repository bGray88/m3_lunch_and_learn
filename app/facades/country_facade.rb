class CountryFacade
  def self.random_country
    Country.new(CountriesService.countries.sample)
  end

  def self.specific_country(country)
    if country.present?
      found_country = CountriesService.countries.find do |api_country|
        api_country[:name][:common].downcase.include?(country.downcase)
      end
      Country.new(found_country) if found_country
    end
  end

  def self.country_validate(country)
    SearchError.new(details: "invalid country") unless specific_country(country)
  end
end
