class Channel < ActiveRecord::Base
  attr_accessible :description, :feed_url, :suscription_id, :title, :url
end
