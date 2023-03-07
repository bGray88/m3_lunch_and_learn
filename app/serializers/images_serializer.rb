class ImagesSerializer
  def self.images(images)
    images.map do |image|
      {
        "alt_tag": image.alt_tag,
        "url":     image.url
      }
    end
  end
end
