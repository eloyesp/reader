class FeedFetcher

  delegate :title, :link, :description, to: :feed

  def initialize feed_url
    @feed_url = smart_add_url_protocol(feed_url)
  end

  def valid_feed?
    return @valid_feed unless @valid_feed.nil?
    feed # force fetching
    @valid_feed
  end

  def each_article
    return unless valid_feed?

    feed.items.each do |item|
      yield item
    end
  end

  private

    def feed
      @feed ||= initialize_feed(@feed_url)
    end

    def initialize_feed url
      if valid_url?
        @feed = SimpleRSS.parse(open(url))
        @valid_feed = true
      end
      @feed
    rescue SimpleRSSError
      @valid_feed = false
      nil
    end

    def valid_url?
      if @feed_url.match URI::DEFAULT_PARSER.regexp[:ABS_URI]
        true
      else
        @valid_feed = false
      end
    end

    def smart_add_url_protocol feed_url
      unless feed_url[/^https?:\/\//]
        feed_url = 'http://' + feed_url
      end
      feed_url
    end

end

