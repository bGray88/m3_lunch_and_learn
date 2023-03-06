class Country

  attr_reader :name,
              :capital_longitude,
              :capital_latitude

  def initialize(data)
    @name              = data.dig(:name, :common)
    @capital_latitude  = data.dig(:capitalInfo, :latlng).first
    @capital_longitude = data.dig(:capitalInfo, :latlng).last
  end
end
