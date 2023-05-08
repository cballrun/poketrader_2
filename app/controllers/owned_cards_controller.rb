class OwnedCardsController < ApplicationController
  def new
    @card = CardFacade.card_by_id(params[:card_id])
  end

  def create
    user = User.find(params[:user_id])
    OwnedCard.create!(user: user, card_id: params[:card_id], condition: params[:condition], language: params[:language])
    redirect_to user_path(params[:user_id])
  end

end