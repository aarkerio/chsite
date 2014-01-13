# Chipotle Software (c) 2013 GPLv3

require 'spec_helper'

describe Page do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid image" do
      FactoryGirl.create(:page).should be_valid
  end
  it "is invalid without a user_id" do
      FactoryGirl.build(:page, user_id: nil).should_not be_valid
  end
end

