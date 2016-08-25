require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
    @secret = @user.secrets.create(content: "secret")
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil 
	  end

  end
end