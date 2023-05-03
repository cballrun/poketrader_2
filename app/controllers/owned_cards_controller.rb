class OwnedCardsController < ApplicationController
  def new
    @card = CardFacade.card_by_id(params[:card_id])
  end
end