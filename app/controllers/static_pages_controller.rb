class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def login
  end

  def landing_page
    @products = Product.limit(3)
    @featured_product = Product.first
  end
end
