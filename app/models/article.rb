class Article < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :description, :link, :published_date, :title
  acts_as_commentable

  has_and_belongs_to_many :starers, class_name: 'User'

end

