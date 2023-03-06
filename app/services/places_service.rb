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

  def self.search(long, lat, limit = 1)
    JSON.parse(
      conn.get("?categories=tourism.sights"\
        "&filter=circle:#{long},#{lat},20000"\
        "&limit=#{limit}"\
        "&apiKey=#{ENV['PLACES_API_KEY']}").body, symbolize_names: true
    )
  end
end
