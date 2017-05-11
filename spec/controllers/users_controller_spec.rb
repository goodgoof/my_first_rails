require "rails_helper"

describe UserController, :type => :controller do 
	let (:user) {User.create!(email: 'peter@example.com', password: '1234567890')}
  	let (:different_user) {User.create!(email: 'quincy@medium.com', password: '0987654321')}
    
    describe 'GET #show' do

      context 'User is logged in' do
      	before do
      	  sign_in user

      end

        it 'loads correct user details' do
        	get :show, params: {id: user.id}
        	expect(response).to have_http_status(200)
        	expect(assigns(:user)).to eq user
        	
        end


      context 'No user is logged in' do
       	it 'redirects to login' do
	      get :show, params: {id: user.id}
	      expect(response).to redirect_to(root_path)
      end
   end


   	   context "user tries to GET #show from different user" do
   	   	before do
   	   		sign_in different_user
       end

       it 'is not allowed to view user #show' do
        get :show, params: {id: user.id}
        expect(response).to have_http_status(302)
      end
  end
end
	
	
end