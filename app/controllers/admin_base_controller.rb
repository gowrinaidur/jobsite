class AdminBaseController < ApplicationController
	layout 'admin'
	before_action :authorize_admin? ,:except=>[:get_states]

	def get_states
		@states = State.where("country_id = ?",params[:country_id]).map{|x| [x.name,x.id] }
		render :json=>@states and return false
	end
end
