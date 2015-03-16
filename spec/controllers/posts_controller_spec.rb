require 'spec_helper'
require 'rails_helper'

describe PostsController do 
	# Testing Routes
	it { should route(:get, '/').to(action: :index) }
	it { should route(:get, '/posts/new').to(action: :new) }
	it { should route(:post, '/posts').to(action: :create) }
	it { should route(:get, '/posts/1/edit').to(action: :edit, id: 1) }
	it { should route(:patch, '/posts/1').to(action: :update, id: 1) }
	it { should route(:get, '/posts/1').to(action: :show, id: 1) }
	it { should route(:delete, '/posts/1').to(action: :destroy, id: 1) }

	# Testing Controller methods
	describe "GET #index" do 
		before { get :index }

		it { should render_template(:index) }
		it { should respond_with(200) }
	end
	describe "POST #create" do 
		it "creates a new post" do 
			expect{
				post :create, post: FactoryGirl.attributes_for(:post)
			}.to change(Post, :count).by(1)
		end

		it "redirects to show page upon save" do 
			post :create, post: FactoryGirl.attributes_for(:post)
			response.should redirect_to(post_path(assigns[:post]))
		end

		it "does not save with invalid attributes" do 
			expect{
				post :create, post: FactoryGirl.attributes_for(:post, title: "")
			}.to_not change(Post, :count)
		end

		it "re-renders the new method" do 
			post :create, post: FactoryGirl.attributes_for(:post, title: "")
			response.should render_template :new
		end
	end

	describe "PUT #update" do 

		let(:attr) do 
		   { :title => 'new title', :text => 'new content' }
		 end

		before(:each) do
			post :create, post: FactoryGirl.attributes_for(:post)
		  put :update, :id => post.id, :post => attr
		  post.reload
		end

		it { response.should redirect_to (post_path(assigns[:post])) }
		it { post.title.should eql attr[:title] }
		it { post.content.should eql attr[:content] }

		it "should render edit page with invalid attributes" do 
		end
	end
	describe "DELETE #destroy" do 
		
	end
end