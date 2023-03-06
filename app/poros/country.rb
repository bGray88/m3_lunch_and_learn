class Country

  attr_reader :name,
              :longitude,
              :latitude

  def initialize(data)
    @name      = data.dig(:name, :common)
    @latitude  = data[:latlng].first
    @longitude = data[:latlng].last
  end
end
