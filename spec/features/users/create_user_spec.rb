require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit 'users/new'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'user2[email]', with: 'kobe@lakers.com'
    fill_in 'user2[name]', with: 'kobe'
    fill_in 'user2[password]', with:  'password'
    fill_in 'user2[password_confirmation]', with: 'password'
    find('input[name="Join"]').click
    last_user = User2.last
    expect(current_path).to eq("/users/#{last_user.id}")
  end
  it 'shows validation errors without proper credentials' do
    find('input[name="Join"]').click
    expect(current_path).to eq('/users/new')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end