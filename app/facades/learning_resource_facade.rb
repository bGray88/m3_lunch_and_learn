class LearningResourceFacade
  def self.combined_resources(country)
    video = find_video(country)
    video ||= {}
    video = VideosSerializer.video(video) unless video == {}
    images = find_images(country)
    images ||= []
    images = ImagesSerializer.images(images) unless images == []
    [video, images]
  end

  def self.find_video(country)
    return {} if country.blank?
    found = process_video_pages(country)
    found ||= {}
    found
  end

  def self.process_video_pages(country)
    pages = ['EAAaATA', 'EAAaBlBUOkNESQ', 'EAAaBlBUOkNHUQ', 'EAAaB1BUOkNKWUI']
    found = {}
    loop do
      current_page = pages.sample
      pages.delete(current_page)
      found = YoutubeService.list_videos(current_page)[:items].find { |video| video.dig(:snippet, :title).downcase.include?(country) }
      return found if found || pages.empty?
    end
  end

  def self.find_images(country)
    UnsplashService.country_images(country)[:results]
  end
end
