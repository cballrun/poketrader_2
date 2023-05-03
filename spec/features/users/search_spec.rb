require 'rails_helper'

RSpec.describe "User Search Dashboard" do
  it 'has a form to search cards by name' do
    test_user = User.create!(name: "Gary Oak", email: "ashisweak@gmail.com")
    visit("users/#{test_user.id}/search")
    within("#card_search") do
      expect(find('form')).to have_content('Card Search')
      expect(find('form')).to have_button('Search')
    end
  end
end