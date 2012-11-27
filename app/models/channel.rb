class Channel < ActiveRecord::Base

  attr_accessible :description, :feed_url, :title, :url

  before_create :parse_feed
  validate      :working_feed

  private

    def fetcher
      @feed_fetcher ||= FeedFetcher.new feed_url
    end

    def parse_feed
      self.title       = fetcher.title
      self.url         = fetcher.link
      self.description = fetcher.description
    end

    def working_feed
      errors.add(:feed_url, "is not working") unless fetcher.valid_feed?
    end

end

