class Suscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  attr_accessible :feed_url, :custom_title

  delegate :feed_url, :description, :url, :articles, to: :channel, allow_nil: true

  def feed_url=(feed_url)
    self.channel = Channel.find_or_create_by_feed_url(feed_url)
  end

  def title
    return custom_title if custom_title?
    channel.title if channel
  end

end

