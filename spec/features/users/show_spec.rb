require 'rails_helper'

RSpec.describe 'the User Show Page' do

  before :each do
    @user_1 = User.create!(email: 'misty@ceruleangym.org', name: 'Misty')
    @user_2 = User.create!(name: 'Brock', email: 'brock@pewtergym.org')

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
  end

end