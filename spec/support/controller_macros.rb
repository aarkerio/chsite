# Chipotle Software (c) 2013-2014 GPLv3

module ControllerMacros 
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      # user.confirm!
      sign_in user
    end
  end
end
