require 'rails_helper'

RSpec.describe User2, type: :model do
  it 'requires a name' do
  	user = User2.new(name: '')
  	user.valid?
  	expect(user.errors[:name].any?).to eq(true)
  end
  it 'requires an email' do
  	user= User2.new(email: '')
  	user.valid?
  	expect(user.errors[:email].any?).to eq(true)
  end
  it 'accepts properly formatted email' do
  	emails = ['kobe@lakers.com', 'kobe.bryant@lakers.com']
  	emails.each do |email|
  		user = User2.new(email: email)
  		user.valid?
  		expect(user.errors[:email].any?).to eq(false)
  	end
  end
  it 'rejects improperly formatted email' do
  	emails = %w[@ user@ @example.com]
  	emails.each do |email|
  		user = User2.new(email: email)
  		user.valid?
  		expect(user.errors[:email].any?).to eq(true)
  	end
  end
  it 'requires a unique, case insensitive email address' do
  	user1 = User2.create(name: 'kobe', email: 'kobe@lakers.com', password: 'password', password_confirmation: 'password')
  	user2 = User2.new(email: user1.email.upcase)
  	user2.valid?
  	expect(user2.errors[:email].first).to eq("has already been taken")
  end
  it 'requires a password' do
  	user = User2.new(password: '')
  	user.valid?
  	expect(user.errors[:password].any?).to eq(true)
  end
  it 'requires the password to match the password confirmation' do
  	user = User2.new(password: 'password', password_confirmation: 'not password')
  	user.valid?
  	expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
  end
  it 'automatically encrypts the password into the password_digest attribute' do
  	user = User2.create(name: 'kobe', email: 'kobe@lakers.com', password: 'password', password_confirmation: 'password')
  	expect(user.password_digest.present?).to eq(true)
  end

  describe 'relationships' do
    it 'has many secrets' do
      user = create_user
      secret1 = user.secrets.create(content: 'secret 1')
      secret2 = user.secrets.create(content: 'secret 2')
      expect(user.secrets).to include(secret1)
      expect(user.secrets).to include(secret2)
    end
    it 'has many likes' do
      user = create_user
      secret1 = user.secrets.create(content: 'Oops')
      secret2 = user.secrets.create(content: 'I did it again')
      like1 = Like.create(user2: user, secret: secret1)
      like2 = Like.create(user2: user, secret: secret2)
      expect(user.likes).to include(like1)
      expect(user.likes).to include(like2)
    end
  end
end