require 'rails_helper'

RSpec.describe 'the New Party Page', vcr: { record: :new_episodes } do

  describe 'owned_card creation' do
    it 'has a form to create an owned card' do
      user = User.create!(email: 'misty@ceruleangym.org', name: 'Misty')
      visit "/users/#{user.id}/cards/col1-33/owned-card/new"
      expect(page).to have_content('Add Call of Legends Snorlax to your collection')
      expect(find('form')).to have_content('Condition')
      expect(find('form')).to have_content('Language')
      expect(find('form')).to have_button('Add Card')  
    end
  end
end