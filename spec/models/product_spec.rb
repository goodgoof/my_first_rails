require "rails_helper"

describe Product do 
	before do
		@product = Product.create!(name:"race bike")
		@user = User.create!(name:"John Smith", email:"test@test.com", password: "123456")
		@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
		@product.comments.create!(rating: 3, user: @user, body: "ok bike!")
		@product.comments.create!(rating: 5, user: @user, body: "beautiful bike!")
	end

		context "when the product has comments" do
		  it "returns the average rating of all comments" do

		  	expect(@product.average_rating).to eq 3
		end

		  it "is not valid" do
    		expect(Product.new(description: "Nice bike")).not_to be_valid
  		end
end
	
end