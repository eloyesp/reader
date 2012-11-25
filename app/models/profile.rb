class Profile < ActiveRecord::Base
  attr_accessible :name, :max_channels_allowed
  has_many :users
end

