require 'rails_helper'

RSpec.describe 'the Card Search Show Page', vcr: { record: :new_episodes }  do

  before :each do
    @user_1 = User.create!(email: 'misty@ceruleangym.org', name: 'Misty')
    @card = CardFacade.card_by_id("neo4-6")

    visit "/users/#{@user_1.id}/cards/#{@card.card_id}"
  end

  it 'can get to the page' do

  end
end