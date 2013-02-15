class StaticPagesController < ApplicationController
	def index
		@orgs = Org.all
	end
end
