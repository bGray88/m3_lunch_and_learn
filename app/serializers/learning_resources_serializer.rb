class LearningResourcesSerializer
  def self.resource(video, images)
    {
      "data": {
        "id":   nil,
        "type": 'learning_resource',
        "attributes": {
          "video":  video,
          "images": images
        }
      }
    }
  end
end
