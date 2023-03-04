class CountriesSerializer
  def self.country(country)
    {
      "data": {
        "id":         nil,
        "attributes": {
          "name": country.name
        }
      }
    }
  end
end
