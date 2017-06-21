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

    context "Search term is entered" do
      it "should render the page and show only results of query" do
        get :index, q: "Bike"
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:products)).to_not eq(Product.all)
      end
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
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:admin)
      sign_in @user
    end
      it 'successfully updates product price' do
        @attr ={name: "James", image_url: "https://www.pinterest.com/pin/494270127825878851", id: @product.id, price: 180.0}
          patch :update, id: @product.id, product: @attr 
            expect(@product.reload.price).to eq 180.0

    end
  end

   context 'Post /update/price' do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
      it 'should not update price' do
        @attr ={name: "James", image_url: "https://www.pinterest.com/pin/494270127825878851", id: @product.id, price: 180.0}
          patch :update, id: @product.id, product: @attr 
            expect(@product.price).to_not eq 180.0

    end
  end



  context 'POST /products' do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:admin)
      sign_in @user
    end
      it 'successfully saves the product' do
        @attr ={name: "Liv", description: "26", image_url: "https://www.pinterest.com/pin/494270127825878851", id: @product.id, price: 180.0, color: "Red" }
          post :create, id: @product.id, product: @attr 
            expect(response). to redirect_to static_pages_index_path
            
          
    end
  end

  context 'POST /products' do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
      it 'should not create product successfully' do
        @attr ={name: "Liv", description: "26", image_url: "https://www.pinterest.com/pin/494270127825878851", id: @product.id, price: 180.0, color: "Red" }
          post :create, id: @product.id, product: @attr 
            expect(response). != be_valid
            
          
    end
  end


  context 'GET /products/:id/edit' do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:admin)
      sign_in @user
    end
      it 'successfully edits the product' do
        @attr ={name: "Liv", description: "26", image_url: "https://www.pinterest.com/pin/494270127825878851", id: @product.id, price: 180.0, color: "Red" }
          get :edit, id: @product.id, product: @attr 
            expect(@product.name).to eq 'James'

    end
  end



  context "DELETE /destroy" do

    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:admin)
      sign_in @user
    end

    it "should allow admin to delete product" do
      expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
    end
  end



end