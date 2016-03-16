class Admin::EventsController < ApplicationController


	def index
		@events = Event.all
	end	
	
	before_action :authenticate
	layout "admin"


	protected

	def authenticate
		authenticate_or_request_with_http_basic do |user_name, password|
		user_name == "username" && password == "password"
	end
	end

end
