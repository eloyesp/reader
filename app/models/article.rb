class Article < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :description, :link, :published_date, :title
  acts_as_commentable
end

