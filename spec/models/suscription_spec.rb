require 'spec_helper'

describe Suscription, :vcr => true do

  it "should handle feed_url" do
    feed_url = "http://www.feedforall.com/sample.xml"
    @suscription = Suscription.new
    @suscription.feed_url = feed_url
    expect(@suscription.feed_url).to eq(feed_url)
  end

  describe "title" do

    before(:each) do
      @suscription = create :suscription
    end

    it "defaults to channel title" do
      expect(@suscription.title).to eq("FeedForAll Sample Feed")
    end

    it "uses custom_title if defined" do
      @suscription.custom_title = "other"
      expect(@suscription.title).to eq("other")
    end

  end

end

