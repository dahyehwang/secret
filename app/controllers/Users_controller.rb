class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	def new
	end
	def create
		@user = User2.create(user_params)
		# @last_user = User2.last
		if @user.valid?
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
  	else	
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/users/new'
  	end
	end
	def show
		@user = User2.find(params[:id])
		@secrets = Secret.all
	end
	def edit
			@user = User2.find(params[:id])
	end
	def update
		@user = User2.find(params[:id])
		@user.update(user_params)
		if @user.valid?
  		redirect_to "/users/#{params[:id]}"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/users/#{params[:id]}/edit"
  	end
	end
	def destroy
		@user = current_user
		@user.destroy
		session.clear()
		redirect_to '/sessions/new'
	end
	private
	def user_params
		params.require(:user2).permit(:name, :email, :password, :password_confirmation)
	end
end