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
    @user = User.find(params[:id])
    @owned_cards = @user.owned_cards
    @cards = @owned_cards.map do |card|
      CardFacade.card_by_id(card.card_id)
    end
  end

  def search
    @user = User.find(params[:id])
  end

  private 
  def user_params
    params.permit(:name, :email)
  end
end

# @cards_array= []
# @owned_cards.each do |card|
#   @cards_array << CardFacade.card_by_id(card.card_id)
# end