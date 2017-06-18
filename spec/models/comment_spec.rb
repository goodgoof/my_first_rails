require "rails_helper"
  
  describe Comment do 
  	before do
  		@user = User.create!(email:"test@test.com", password: "123456")
		  @product = Product.create!(name:"race bike", description:"24", price: "780.0", color: "red")
      @product.comments.create!(rating: 5, user: @user, body: "beautiful bike!", product_id: @product.id)
	 end

  	context "when comment is entered"

  		it "is valid with a body,user, product and rating" do
  			expect(Comment).to_be_valid
  	end

  	context "body empty" do
    it "is not valid"do
      expect(Comment.new(body: "")).not_to be_valid
    end
  end
end



  	
  
