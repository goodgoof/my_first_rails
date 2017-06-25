require "rails_helper"

describe Product do 
	before do
		@product = Product.create!(name:"race bike", description:"24", price: "780.0", color: "red")
		@user = User.create!(first_name:"John", last_name:"Smith", email:"test@test.com", password: "123456")
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

describe Product do 
	before do
		@product = Product.create!(name:"race bike", description:"24", price: "780.0", color: "red")
		@user = User.create!(first_name:"John", last_name:"Smith", email:"mail@mail.com", password: "123456")
		@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
		@product.comments.create!(rating: 5, user: @user, body: "beautiful bike!")
	end

  		context "when the product has comments" do
		  it "returns the the highest rating of all comments" do

		  	expect(@product.highest_rating_comment.rating).to eq 5
		end
		it "is not valid" do
    		expect(Product.new(description: "beautiful bike")).not_to be_valid
  		end
	end

		context "when the product has comments" do
		  it "returns the the lowest rating of all comments" do

		  	expect(@product.lowest_rating_comment.rating).to eq 1
		end
		it "is not valid" do
    		expect(Product.new(description: "Awful bike")).not_to be_valid
  		end
	end


describe ".search" do
	
    let(:some_product) { Product.create!(name:"race bike", description:"24", price: "780.0", color: "red") }
    let(:some_other_product) { Product.create!(name:"Liv", description:"26", price: "480.0", color: "Blue") }

    subject { Product.search("race bike") }

      it "should return products matching the search term" do
        expect(subject.name).to include("race")
      end
    end
end
    
end




