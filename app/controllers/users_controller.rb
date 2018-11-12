class UsersController < ApplicationController
	def new
		

	end
	def create
		user = User.new(user_params)
		logger.debug "#{user.errors.messages}"
    	logger.debug "params: #{params}"
		if user.save
			session[:user_id] = user.id
			redirect_to '/', notice: "Thank you for signing up!"
		else
			redirect_to "/signup"
		end
	end

	private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
	
end
