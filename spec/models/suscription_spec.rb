require 'spec_helper'

describe Suscription do

  before(:each) do
    @suscription = create :suscription
  end

  it "should handle feed_url" do
    @suscription.feed_url = "www.samplefeed.com"
    expect(@suscription.feed_url).to eq("www.samplefeed.com")
  end

  describe "title" do

    before(:each) do
      @channel = create :channel, title: "foo"
      @suscription = create :suscription, channel: @channel
    end

    it "defaults to channel title" do
      expect(@suscription.title).to eq("foo")
    end

    it "uses custom_title if defined" do
      @suscription.custom_title = "other"
      expect(@suscription.title).to eq("other")
    end

  end

end

