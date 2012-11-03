require 'spec_helper'

describe Picture do

  describe "item association" do
    before do
      @item = FactoryGirl.create(:item)
      @pic = @item.pictures.create()
    end

    it "should have a user attribute" do
      @pic.should respond_to(:item)
    end

    it "should have the correct item" do
      @pic.item_id.should == @item.id
      @pic.item.should == @item
    end
  end
end
