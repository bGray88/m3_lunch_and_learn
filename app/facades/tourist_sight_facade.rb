class TouristSightFacade
  def self.search_sights(long, lat, limit = 1)
    PlacesService.search(long, lat, limit)[:features].map do |feature|
      Place.new(feature)
    end
  end
end
