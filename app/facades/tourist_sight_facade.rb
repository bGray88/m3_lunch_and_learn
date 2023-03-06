class TouristSightFacade
  def self.search_sights(country, limit = 1)
    found_country = RestCountryFacade.specific_country(country)
    PlacesService.search(found_country.capital_longitude, found_country.capital_latitude, limit)[:features].map do |feature|
      Place.new(feature)
    end
  end
end
