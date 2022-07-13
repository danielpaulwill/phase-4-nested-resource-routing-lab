class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
      render json: user, include: :items
  end

  def user_items
    user = User.find_by(id: params[:user_id])
    if user
      items = user.items
      render json: items
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

end
