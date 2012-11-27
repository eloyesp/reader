require 'spec_helper'

describe Channel do

  describe 'fetching', :vcr => true do

    it 'fetch the feed on creation' do
      @channel = Channel.create feed_url: "http://www.feedforall.com/sample.xml"
      expect(@channel.title).to eq("FeedForAll Sample Feed")
    end

    it 'will not work with invalid url' do
      @channel = Channel.create feed_url: "not a valid url"
      expect(@channel).to_not be_valid
    end

  end

end

