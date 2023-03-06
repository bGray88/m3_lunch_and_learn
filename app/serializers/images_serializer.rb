class ImagesSerializer
  def self.images(images)
    images.map do |image|
      {
        "alt_tag": image[:alt_description],
        "url":     image.dig(:urls, :regular)
      }
    end
  end
end
