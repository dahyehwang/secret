require 'rails_helper'
RSpec.describe 'editing user' do
  it 'displays prepopulated form' do
    user = create_user
    log_in user
    click_link 'Edit Profile'
    expect(page).to have_field('user2[email]')
    expect(page).to have_field('user2[name]')
  end
end