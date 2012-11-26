class Suscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  attr_accessible :feed_url

  delegate :feed_url, to: :channel, allow_nil: true

  def feed_url=(feed_url)
    self.channel = Channel.find_or_create_by_feed_url(feed_url)
  end

end

