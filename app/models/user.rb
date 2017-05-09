class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders
	has_many :comments

	def confirm! 
		welcome_email
		super
	end

	def after_confirmation
  		welcome_email
	end

	# private methods
	private

	def welcome_email
		UserMailer.welcome_email(self).deliver
	end


end
