class User < ActiveRecord::Base
	has_secure_password

	attr_accessor :firstname, :lastname, :email, :password, :password_confirmation
	validates_uniqueness_of :email
end
