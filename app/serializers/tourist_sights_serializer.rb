class TouristSightsSerializer
  def self.sights(sights)
    binding.pry
    {
      "data": sights.map do |sight|
        {
          "id": null,
          "type": "tourist_sight",
          "attributes": {
              "name": sight.name,
              "address": sight.address,
              "place_id": "51d28..."
          }
        }
      end
    }
  end
end
