require 'test_helper'
require 'factories'

class PostsControllerTest < ActionController::TestCase
  describe PostsController do 

  	context "#index" do 
  		it "is successful" do 
  			get :index
  			expect(response).to be_success
  		end

  		it "loads a list of posts" do
  			get :index
  			expect(response).to render_template("index")
  		end
  	end

  	context "#create" do
  		let(:post){FactoryGirl.attributes_for :post}
  		it "creates a new post with valid attributes" do
  			expect {
  				post :create, :post => post
  			}.to change{ Post.count}.by(1)
  		end

  		it "does not create a new post with invalid attributes" do 
  		end
  	end

  	context "#edit" do
  	end

  	context "#show" do
  		let(:post) {FactoryGirl.create :post}
  		it "is successful" do 
  			get :show, :id => post.id
  			expect(response).to be_success
  		end

  		it "assigns a post to the Post found by ID" do 
  			get :show, :id => post.id
  			expect(assigns(:post)).to eq post
  		end
  	end

  	context "#destroy" do
  		let(:post){FactoryGirl.create :post}
  		it "destroys a post" do
  			expect{
  				delete :destroy, :id => post.id
  			}.to change {Post.count}.by(-1)
  		end
  	end
  end
end
