class TouristSightFacade
  def self.search_sights(country, limit = 1)
    return [] if country.blank?
    found_country = RestCountryFacade.specific_country(country)
    if found_country
      PlacesService.search(found_country.capital_longitude, found_country.capital_latitude, limit)[:features].map do |feature|
        Place.new(feature)
      end
    end
  end
end
