class RestCountryService
  def self.conn
    Faraday.new(
      url: "https://restcountries.com/v3.1/all",
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def self.all_countries
    JSON.parse(conn.get.body, symbolize_names: true)
  end
end