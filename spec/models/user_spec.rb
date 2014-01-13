# Chipotle Software(c) 2013

# spec/models/user_spec.rb

require 'spec_helper'

describe User do

  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid user model data" do
      FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a firstname" do
      FactoryGirl.build(:user, fname: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
      FactoryGirl.build(:user, lname: nil).should_not be_valid
  end

  it "does not allow duplicate unames" do
      FactoryGirl.create(:user, fname: "home", uname: "aarkerio")
      FactoryGirl.build( :user, uname: "aarkerio").should_not be_valid
  end

  it "returns a user's full name as a string" do 
      user = FactoryGirl.create(:user, fname: "John", lname: "Doe")
      user.name.should == "John Doe"
  end

  it "returns a sorted array of results that match" do
      smith   = FactoryGirl.create(:user, lname: "Smith")
      jones   = FactoryGirl.create(:user, lname: "Jones")
      johnson = FactoryGirl.create(:user, lname: "Johnson")
      
      User.by_letter("J").should == [johnson, jones]
 end

 # This avoid redundance in the code using "before" rspec block
 describe "filter last name by letter" do  
    before :each do  
      @smith   = FactoryGirl.create(:user, lname: "Smith")
      @jones   = FactoryGirl.create(:user, lname: "Jones")
      @johnson = FactoryGirl.create(:user, lname: "Johnson")
    end

    context "matching letters" do
      it "returns a sorted array of results that match" do
        User.by_letter("J").should == [@johnson, @jones]
      end
    end

    context "non-matching letters" do
      it "does not return contacts that don't start with the provided letter" do
        User.by_letter("J").should_not include @smith
      end
    end
  end
end
