class SessionsController < ApplicationController
	def index
	end
	def new
	end
	def login
		@email = user_params[:email]
		@password = user_params[:password]
		@user = User2.find_by_email(@email)

		if @user.authenticate(@password)
			session[:user_id] = @user[:id]
			redirect_to "/users/#{@user[:id]}"		
		else
			flash[:errors] = ['Invalid']
			redirect_to '/sessions/new'
		end 
	end
	def show
	end
	def logout
		session[:user_id] = nil
		session.clear()
    redirect_to '/sessions/new'
	end
	private
	def user_params
		params.require(:user2).permit(:email, :password)
	end
end