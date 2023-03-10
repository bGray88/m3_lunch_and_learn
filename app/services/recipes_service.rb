class RecipesService
  def self.conn
    Faraday.new(
      url: "https://api.edamam.com/api/recipes/v2",
      params: {
        type: 'public',
        app_id: ENV['EDAMAM_APP_ID'],
        app_key: ENV['EDAMAM_APP_KEY']
      },
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def self.search_by_name(search_term)
    JSON.parse(conn.get { |req| req.params[:q] = search_term }.body, symbolize_names: true)
  end
end
