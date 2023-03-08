class LearningResourceFacade
  def self.combined_resources(country)
    valid_country = CountryFacade.country_validate(country) if country.present?
    return valid_country if valid_country.is_a?(SearchError)
    video = find_video(country)
    video ||= {}
    unless video == {}
      video = VideosSerializer.video(video)
      images = find_images(country)
    end
    images ||= []
    images = ImagesSerializer.images(images) unless images == []
    LearningResourcesSerializer.resource(video, images)
  end

  def self.find_video(country)
    return {} if country.blank?
    found = process_video_pages(country)
    return {} unless found
    Video.new(found)
  end

  def self.process_video_pages(country)
    pages = ['EAAaATA', 'EAAaBlBUOkNESQ', 'EAAaBlBUOkNHUQ', 'EAAaB1BUOkNKWUI']
    loop do
      current_page = pages.sample
      pages.delete(current_page)
      found = VideosService.list_videos(current_page)[:items].find { |video| video.dig(:snippet, :title).downcase.include?(country) }
      return found if found || pages.empty?
    end
  end

  def self.find_images(country)
    return [] if country.blank?
    found = ImagesService.country_images(country)
    return [] if found.is_a?(Hash) && found[:errors]
    found.map { |image| Image.new(image) }
  end
end
