require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'relationships' do
    before do
      @user = create_user
      @secret = @user.secrets.create(content: 'Oops')
      @like = Like.create(user2: @user, secret: @secret)
    end
    it 'belongs to a user' do
      expect(@like.user2).to eq(@user)
    end
    it 'belongs to a secret' do
      expect(@like.secret).to eq(@secret)
    end
  end
end
