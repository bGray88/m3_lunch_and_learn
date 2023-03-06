class TouristSightFacade
  def self.search_sights(country, limit = 1)
    found_country = RestCountryFacade.specific_country(country)
    PlacesService.search(found_country.longitude, found_country.latitude, limit)[:features].map do |feature|
      Place.new(feature)
    end
  end
end
