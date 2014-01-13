# Chipotle Software(c) 2013

require 'spec_helper'

describe "pages/index" do

  before(:each) do
      (1..5).each do |num|
          FactoryGirl.create(:page, title: "elpoema#{num}")
      end
      @pages = Page.all
      
      (1..5).each do |num|
          FactoryGirl.create(:section)
      end
      @sections = Section.all

      (1..5).each do |num|
          FactoryGirl.create(:user)
      end
      @users = User.all
      view.stub(:will_paginate)

      render
  end

  it "renders a list of pages" do

      assert_select "tr>th", :text => "Title".to_s,    :count => 1 
      assert_select "tr>td", :text => "elpoema2".to_s, :count => 1
  end

  it "rendered must have h1 Listing Pages" do

      assert_select("tr>th", :text => "Title".to_s,  :count => 1)
      assert_select("tr>th", :text => "User".to_s,   :count => 1)
      assert_select("tr>td", "Edit".to_s, 5)
      assert_select("h1", "Listing pages")
  end
end
