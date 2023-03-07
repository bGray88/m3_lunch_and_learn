class Image

  attr_reader :url,
              :alt_tag

  def initialize(data)
    @url     = data.dig(:urls, :regular)
    @alt_tag = data[:alt_description]
  end
end
