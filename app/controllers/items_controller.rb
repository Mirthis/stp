class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      redirect_to @item, :flash => { :success => "Item created" }
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

end