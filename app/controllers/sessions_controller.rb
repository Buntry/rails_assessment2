class SessionsController < ApplicationController
	def new; end
	
	def create
		user = User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path
		else
			redirect_to login_path
		end
	end
	
	def destroy
		session.clear
		redirect_to root_path
	end
	
	def check_omniauth
		if user = User.find_by(uid: auth['uid'])
			session[:user_id] = user.id
		else
			User.create_with_omniauth(auth)
		end
		
		redirect_to root_path
	end

end
