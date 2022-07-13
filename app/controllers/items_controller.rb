class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items, include: :user
  end

  def user_items
    puts "hello"
    user = User.find_by(id: params[:user_id])
    if user
      items = user.items
      render json: items
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  def user_items_id
    user = User.find_by(id: params[:user_id])
    the_items = user.items
    the_item = the_items.find(params[:id])
    if the_item.valid?
      puts "all good"
      render json: the_item
    else
      puts "render errors!!!"
      render json: { error: "Item not found" }, status: :not_found
    end
  end

  def add_item
    user = User.find_by(id: params[:user_id])
    new_item = user.items.create(name: params[:name], description: params[:description], price: params[:price])
    render json: new_item, status: :created
  end


end
