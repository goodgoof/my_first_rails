class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def login
  end

  def landing_page
    @products = Product.all
    @featured_product = Product.first
  end
end
