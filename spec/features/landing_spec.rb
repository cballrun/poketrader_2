require 'rails_helper'

RSpec.describe 'When I visit the landing page', type: :feature do
  let!(:erin) { User.create!(name: 'Erin', email: 'epintozzi@turing.edu') }
  let!(:mike) { User.create!(name: 'Mike', email: 'mike@turing.edu') }
  let!(:meg) { User.create!(name: 'Meg', email: 'mstang@turing.edu') }
  before(:each) {visit '/'}

  it 'has a button to create new user' do
    expect(page).to have_button('Create a New User')
    click_button
    expect(current_path).to eq('/register')
  end
  
end