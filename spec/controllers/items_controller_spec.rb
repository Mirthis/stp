require 'spec_helper'

describe ItemsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

   describe "POST 'create'" do

    describe "failure" do
      before { @attr = {} }

      it "should not not create a post" do
        lambda do
          post 'create', :item => @attr
        end.should_not change(Item, :count)
      end
      
      it "should re-render the new page" do
        post 'create', :item => @attr
        response.should render_template('items/new')
      end
    end

    describe "success" do
      before { @attr = {title: "test", description: "test"} }

      it "should create a post" do
        lambda do
          post 'create', :item => @attr
        end.should change(Item, :count)
      end

      it "should show the post" do
        post 'create', :item => @attr
        response.should redirect_to(Item.first)
      end
    end
  end 

  describe "GET 'show'" do
    before { @item = FactoryGirl.create(:item) }
    
    it "returns http success" do
      get :show, :id => @item.id
      response.should be_success
    end

    it "should find the right post" do
      get :show, :id => @item.id
      assigns(:item).should == @item
    end
  end

  describe "get 'edit'" do
   before { @item = FactoryGirl.create(:item) }
    
    it "returns http success" do
      get :edit, :id => @item.id
      response.should be_success
    end
  end

  describe "POST 'update'" do
    before { @item = FactoryGirl.create(:item) }

    describe "failure" do
      before { @attr = {title: ""} }

      it "should render the edit page" do
        put :update, :id => @item, :post => @attr
        response.should render_template('edit')
      end
    end

    describe "success" do
      before { @attr = {title: "test", description: "test"} }

      it "should update the article" do
        put :update, :id => @item, :post => @attr
        @item.reload
        @item.title.should == @attr[:title]
        @item.description.should == @attr[:description]
      end

      it "should show a flash message" do
        put :update, :id => @item, :post => @attr
        flash[:success].should =~ /updated/
      end
    end
  end
end
