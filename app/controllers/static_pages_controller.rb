class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def login
  end

  def landing_page
    @featured_product=Product.first
  end
end
