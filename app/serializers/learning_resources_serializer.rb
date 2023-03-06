class LearningResourcesSerializer
  def self.resource(video, images)
    {
      "data": {
        "id":   nil,
        "type": 'learning_resource',
        "attributes": {
          "video":  video,
          "images": images.map do |image|
            {
              "alt_tag": image[:alt_description],
              "url":     image.dig(:urls, :regular)
            }
          end
        }
      }
    }
  end
end
