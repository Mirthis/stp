class ItemsController < ApplicationController

  def new
    @item = Item.new
    5.times { @item.pictures.build } 
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      redirect_to @item, :flash => { :success => "Item created" }
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
    (5 - @item.pictures.count).times { @item.pictures.build }
  end

  def update
    @item = Item.find(params[:id])
    
    if @item.update_attributes(params[:item])
      redirect_to @item, :flash => { :success => "Item updated" }
    else
      render 'edit'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

end