require 'rails_helper'

describe ProductsController, :type => :controller do
  context 'GET /index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    
  end

  context 'GET /show' do
    before do
      @product = Product.create!(name:"race bike", description:"24", price: "780.0", color: "red")
      @user = User.create!(first_name:"John", last_name:"Smith", email:"test@test.com", password: "123456")
    end
      it 'renders the show template' do
        get :show, params: { id: @user.id }
          expect(response).to be_ok
          expect(response). to render_template('show')
    end
  end

  context 'Post /update/price' do
    before do
      @product = FactoryGirl.build(:product)
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end
      it 'successfully updates product price' do
        @attr ={name: "James", image_url: "https://www.pinterest.com/pin/494270127825878851", id: @product.id, price: "$180.0"}
          post :update, id: @product.id, product: @attr 
            expect(price).to eq 180.0
          
    end
  end

  context "DELETE /destroy" do

    before do
      @product = FactoryGirl.build(:product, :price)
      @user = FactoryGirl.build(:admin)
      sign_in user
    end

    it "should allow admin to delete product" do
      expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
    end
  end



end