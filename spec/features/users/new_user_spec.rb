require 'rails_helper'
RSpec.describe 'signing up' do
  it 'prompts for valid fields' do
    visit '/users/new'
    expect(page).to have_field('user2[email]')
    expect(page).to have_field('user2[name]')
    expect(page).to have_field('user2[password]')
    expect(page).to have_field('user2[password_confirmation]')
  end
end