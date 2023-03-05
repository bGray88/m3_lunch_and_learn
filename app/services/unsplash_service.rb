class UnsplashService
  def self.conn
    Faraday.new(
      url:       'https://api.unsplash.com/search/photos',
      params: {
        client_id: ENV['UNSPLASH_CLIENT_ID']
      },
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def self.country_images(country)
    JSON.parse(conn.get { |req| req.params[:query] = country }.body, symbolize_names: true)
  end
end
