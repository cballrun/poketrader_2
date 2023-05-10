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
    @user = User.find(params[:user_id])
    @card = @user.owned_cards.where(card_id: params[:card_id]).first
  end

  def update
    user = User.find(params[:user_id])
    card = user.owned_cards.where(card_id: params[:card_id]).first
    if params[:condition_image]
      card.update!(:condition_image => params[:condition_image])
      redirect_to user_path(user.id)
    else
      redirect_to "/users/#{user.id}/cards/#{card.card_id}/owned-cards/edit"
    end
  end

  private 

  def owned_card_params
    params.permit(:card_id, :condition, :language, :condition_image)
  end
end