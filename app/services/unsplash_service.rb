class UnsplashService
  def self.conn
    Faraday.new(
      url:    'https://api.unsplash.com/photos/random',
      params: {
        client_id: ENV['UNSPLASH_CLIENT_ID'],
        count:     10
      },
      headers: {'Content-Type' => 'application/json', 'Accept-Version' => 'v1' }
    )
  end

  def self.country_images(country)
    JSON.parse(conn.get { |req| req.params[:query] = country }.body, symbolize_names: true)
  end
end
