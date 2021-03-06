class Product < ApplicationRecord
    has_many :orders
    has_many :comments
    validates :name, :description, :price, :color,presence: true

	def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
	end

	def highest_rating_comment
	  comments.rating_desc.first
	end

	def lowest_rating_comment
	  comments.rating_asc.first
	end

	def average_rating
	  comments.average(:rating).to_f
	end

	def views
	  $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
	end

	def viewed!
	  $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
	end

end




