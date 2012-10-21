require 'spec_helper'

describe Item do

 before(:each) do
    @attr = {
      title: "My first item",
      description:  "You are going to love this" 
    }
  end

  it "should create a new instance given valid attributes" do
    Item.create!(@attr)
  end

  describe "validation" do

    it "should require a title" do
      no_title_item = Item.new(@attr.merge(:title => ""))
      no_title_item.should_not be_valid
    end

    it "should require a body" do
      no_body_item = Item.new(@attr.merge(:description => ""))
      no_body_item.should_not be_valid
    end

    it "should reject a long title" do
      long_title_item = Item.new(@attr.merge(:title => "a" * 511 ))
      long_title_item.should_not be_valid    
    end
  end
end
