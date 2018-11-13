class RatingsController < ApplicationController
	before_filter :authenticate
	def create
  		# raise "Yay, I'm here!"
  		@rating = Rating.new(reviews_params)
    	@rating.product = Product.find(params[:product_id])
    	@rating.user = current_user

    	if @rating.save
    		redirect_to @rating.product, notice: "Your review has been saved!"
    	else
    		redirect_to @rating.product, notice: "Error, review not saved!"
    	end
	end

	def destroy
		rating = Rating.find(params[:id])
		rating.destroy
		redirect_to rating.product
	end
     
    private
  
	def reviews_params
	    params.require(:rating).permit(
	      :description,
	      :rating
	    )
	end

	def authenticate
		if !current_user
			redirect_to "/"
		end
	end


end
