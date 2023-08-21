require 'rails_helper'

RSpec.describe 'the owned card update update' do
  before :each do
    @user = create(:user)
    @card = create(:owned_card, user: @user, card_id: "neo4-6")
    visit "/users/#{@user.id}/cards/#{@card.card_id}/owned-cards/edit"
  end
  
  it "shows the owned card edit form" do
    expect(find('form')).to have_content('Add image')
  end

  context 'given valid data' do
    it 'submits the edit form and adds the image to the card' do

    end
  end

  context 'given invalid data' do
    it 'returns you to to the card edit page' do
      click_button
      expect(current_path).to eq("/users/#{@user.id}/cards/#{@card.card_id}/owned-cards/edit")
    end
  end


end