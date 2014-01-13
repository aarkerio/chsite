# Chipotle Software (c) 2013 GPLv3

require 'spec_helper'

describe Share do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid image" do
      FactoryGirl.create(:share).should be_valid
  end
  it "is invalid without a user_id" do
      FactoryGirl.build(:share, user_id: nil).should_not be_valid
  end
end

