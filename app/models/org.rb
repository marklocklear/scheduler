class Org < ActiveRecord::Base
	has_many :sessions
	belongs_to :user
  attr_accessible :name
end
