class SecretsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	def index 
		@secrets = Secret.all
	end
	def create
		@secret = Secret.create(user2_id: params[:user_id], content: params[:content])
		redirect_to "/users/#{params[:user_id]}"
	end
	def destroy
		@secret = Secret.find(params[:id])
		@secret.destroy if @secret.user2 == current_user
		# redirect_to :back
		redirect_to "/users/#{current_user.id}"
	end
end