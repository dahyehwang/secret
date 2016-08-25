require 'rails_helper'
RSpec.describe 'deleting a secret' do
  before do
    @user = create_user
    log_in @user
    fill_in 'content', with: 'My secret'
    find('input[name="New_Secret"]').click
    expect(page).to have_text('My secret')
  end
  it 'deletes secrets from profile page and redirects to profile page' do
    find('input[name="delete"]').click
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My secret')
  end
  it 'deletes secret from secrets index page and redirects to current user profile page' do
    visit '/secrets'
    find('input[name="delete"]').click
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My secret')
  end
end