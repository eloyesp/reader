require 'spec_helper'

describe Suscription do

  before(:each) do
    @suscription = create :suscription
  end

  it "should handle feed_url" do
    @suscription.feed_url = "www.samplefeed.com"
    expect(@suscription.feed_url).to eq("www.samplefeed.com")
  end

end

