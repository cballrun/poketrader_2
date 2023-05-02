require 'rails_helper'

RSpec.describe 'the Card Search Index Page', vcr: { record: :new_episodes }  do
  before :each do
    @user_1 = User.create!(email: 'misty@ceruleangym.org', name: 'Misty')
    @user_2 = User.create!(name: 'Brock', email: 'brock@pewtergym.org')

    visit "/users/#{@user_1.id}/search"
  end

  context 'card search by name' do
    describe 'after the search field is filled out and submitted' do
      it 'returns cards where the name includes the search term' do
        fill_in 'Card Search', with: 'wurmple'
        click_button 'Search'
        
        expect(page).to have_content('Wurmple')

      end
    end
  end

end