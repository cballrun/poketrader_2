class CardsController < ApplicationController
  before_action :set_user

  def index
    @cards = CardFacade.get_cards_by_name(params[:q])
  end

  def show
    @card = CardFacade.card_by_id(params[:id])
  end

end
