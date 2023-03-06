class PlacesService
  def self.conn
    Faraday.new(
      url: "https://api.geoapify.com/v2/places",
      params: {
        apiKey: ENV['PLACES_API_KEY']
      },
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def self.search(long, lat, radius, limit = 1)
    JSON.parse(
      conn.get("?categories=tourism.sights&filter=circle:#{long},#{lat},#{radius}&limit=#{limit}&apiKey=#{ENV['PLACES_API_KEY']}").body, symbolize_names: true
    )
  end
end
