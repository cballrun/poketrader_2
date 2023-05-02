class UsersController < ApplicationController

  def register

  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def show
    
  end

  private 
  def user_params
    params.permit(:name, :email)
  end
end