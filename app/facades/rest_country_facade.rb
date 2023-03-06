class RestCountryFacade
  def self.random_country
    Country.new(RestCountryService.countries.sample)
  end

  def self.specific_country(country)
    if country.present?
      found_country = RestCountryService.countries.find do |api_country|
        api_country[:name][:common].downcase.include?(country.downcase)
      end
      Country.new(found_country) if found_country
    end
  end
end
