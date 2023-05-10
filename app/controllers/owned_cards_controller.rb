class OwnedCardsController < ApplicationController
  def new
    @card = CardFacade.card_by_id(params[:card_id])
  end

  def create
    user = User.find(params[:user_id])
    user.owned_cards.create!(owned_card_params)
    redirect_to user_path(params[:user_id])
  end

  def edit
    
  end

  private 

  def owned_card_params
    params.permit(:card_id, :condition, :language, :condition_image)
  end
end