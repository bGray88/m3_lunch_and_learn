class RestCountryFacade
  def self.random_country
    RestCountryService.all_countries.map do |country|
      Country.new(country)
    end.sample
  end
end
