class Channel < ActiveRecord::Base

  attr_accessible :description, :feed_url, :title, :url

  before_create :parse_feed
  validate      :working_feed

  private

    def parse_feed
      if feed_url? and valid_feed_url?
        @rss = SimpleRSS.parse(open(feed_url))
        self.title =  @rss.title
        self.url   =  @rss.link
        self.description = @rss.description
        @valid_feed = true
      end
    rescue SimpleRSSError
      @valid_feed = false
    end

    def valid_feed_url?
      self.feed_url = "http://" << feed_url unless feed_url =~ /^http/
      if feed_url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
        true
      else
        @valid_feed = false unless feed_url.match URI::DEFAULT_PARSER.regexp[:ABS_URI]
      end
    end

    def working_feed
      errors.add(:feed_url, "The feed url is not working") unless valid_feed
    end

    def valid_feed
      @valid_feed ||= parse_feed
    end
end

