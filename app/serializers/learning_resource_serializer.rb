class LearningResourceSerializer
  def self.resource(video, images)
    {
      "data": {
        "id":   nil,
        "type": 'learning_resource',
        "attributes": {
          "video":  {
            title:            video.dig(:items, 0, :snippet, :title),
            youtube_video_id: video.dig(:items, 0, :snippet, :resourceId, :videoId)
          },
          "images": images.map do |image|
            {
              "alt_tag": image.dig(0, :alt_description),
              "url":     image.dig[0, :urls, :regular]
            }
          end
        }
      }
    }
  end
end
