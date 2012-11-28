class Channel < ActiveRecord::Base

  has_many :articles

  attr_accessible :description, :feed_url, :title, :url

  before_create :parse_feed
  validate      :working_feed

  def fetch_articles
    fetcher.each_article do |a|
      self.articles.find_or_create_by_title a.title,
                    link:           a.link,
                    description:    a.description,
                    published_date: a.pubDate
    end
  end

  private

    def fetcher
      @feed_fetcher ||= FeedFetcher.new feed_url
    end

    def parse_feed
      self.title       = fetcher.title
      self.url         = fetcher.link
      self.description = fetcher.description
      fetch_articles
    end

    def working_feed
      errors.add(:feed_url, "is not a working url") unless fetcher.valid_feed?
    end

end

