class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def login
  end

  def landing_page
    @products = Product.limit(5)
    #@featured_product = Product.first
  end

  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  

  UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  
end
