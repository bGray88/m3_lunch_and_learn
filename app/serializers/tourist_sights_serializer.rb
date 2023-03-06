class TouristSightsSerializer
  def self.sights(sights)
    binding.pry
    {
      "data": sights.map do |sight|
        {
          "id": null,
          "type": "tourist_sight",
          "attributes": {
              "name": "Tour de l'horloge",
              "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
              "place_id": "51d28..."
          }
        }
      end
    }
  end
end
