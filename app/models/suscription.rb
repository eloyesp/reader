class Suscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  attr_accessible :custom_title
end
