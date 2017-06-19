require "rails_helper"
  
  describe Comment do 
    context "when creating comment " do
  	  before do
  		  @user = FactoryGirl.build(:user)
		    @product = FactoryGirl.build(:product)
        
	 end

  		it "is valid with a body,user, product and rating" do
  			expect(Comment.new(body: "Beautiful bike", user: @user, product: @product, rating: 4)).to be_valid
  	end
  	
    it "is not valid when body is empty" do
      expect(Comment.new(body: "")).not_to be_valid
    end

    it "is not valid when product is not present" do
      expect(Comment.new(body: "beautiful bike", user: @user, rating: 5)).not_to be_valid
    end
    
    it "is not valid when rating is not numerical" do
      expect(Comment.new( rating: "James")).not_to be_valid
    end

    it "is not valid when user is not signed in" do
      expect(Comment.new( body: "Beautiful bike", product: @product, rating: 4)).not_to be_valid
    end
  end
end



  	
  
