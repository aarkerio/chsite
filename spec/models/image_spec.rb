# Chipotle Software(c) 2013
# APP/spec/models/user_spec.rb

require 'spec_helper'

describe Image do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid image" do
      FactoryGirl.create(:image).should be_valid
  end
  it "is invalid without a user_id" do
      FactoryGirl.build(:image, user_id: nil).should_not be_valid
  end

end
