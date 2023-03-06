class LearningResourceFacade
  def self.combined_resources(country)
    video  = self.find_video(country)
    images = self.find_images(country)
    [video, images]
  end

  def self.find_video(country)
    if country.nil? || country == ""
      return {}
    else
      pages = ['EAAaATA', 'EAAaBlBUOkNESQ', 'EAAaBlBUOkNHUQ', 'EAAaB1BUOkNKWUI']
      loop do
        current_page = pages.sample
        pages.delete(current_page)
        found = YoutubeService.list_videos(current_page)[:items].find { |video| video.dig(:snippet, :title).downcase.include?(country) }
        return found if found || pages.empty?
      end
    end
  end

  def self.find_images(country)
    UnsplashService.country_images(country)[:results]
  end
end
