require 'rails_helper'

RSpec.describe 'the User Show Page' do

  before :each do
    @user_1 = User.create!(email: 'epintozzi@turing.edu', name: 'epintozzi@turing.edu')
    @user_2 = User.create!(name: 'Mike', email: 'mike@turing.edu')

    visit "/users/#{@user_1.id}"
  end

  describe 'the dashboard content' do
    it 'has the users name' do
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user_2.name}'s Dashboard")
    end
  end

end