require 'spec_helper'

describe "pages/show" do

  before(:each) do
      @user     = FactoryGirl.create(:user)
      @page     = FactoryGirl.create(:page)
      (1..5).each do |num|
          FactoryGirl.create(:section)
      end
      @sections = Section.all
   end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Published/)
    rendered.should match(/Section/)
  end
end
