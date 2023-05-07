require 'rails_helper'

RSpec.describe 'the User Show Page', vcr: { record: :new_episodes } do

  before :each do
    @user_1 = User.create!(email: 'misty@ceruleangym.org', name: 'Misty')
    @user_2 = User.create!(name: 'Brock', email: 'brock@pewtergym.org')
    @card_1 = @user_1.owned_cards.create!(card_id: 'neo4-6', condition: 2, language: "English")
    @card_2 = @user_1.owned_cards.create!(card_id: 'swshp-SWSH221', condition: 1, language: "English")
    @card_3 = @user_2.owned_cards.create!(card_id: 'gym2-41', condition: 1, language: "English")


    visit "/users/#{@user_1.id}"
  end

  describe 'the dashboard content' do
    it 'has the users name' do
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user_2.name}'s Dashboard")
    end

    it 'has button to take you to card search page' do
      expect(page).to have_button("Search Cards")
      click_button
      expect(current_path).to eq("/users/#{@user_1.id}/search")

    end

    it 'displays the users cards' do
      expect(page).to have_content("Dark Gengar")
      expect(page).to_not have_content("Erika's Ivysaur")
    end
  end

end