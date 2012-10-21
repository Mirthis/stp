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
end
