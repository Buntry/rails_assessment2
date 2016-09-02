class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end
	
	def index
		@users = User.order('name asc')
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.recipes.each do |r|
			r.delete
		end
		@user.delete
		
		redirect_to root_path
	end
	
	private
	def user_params
		params.require(:user).permit(:name, :password)
	end
end
