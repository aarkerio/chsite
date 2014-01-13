require 'spec_helper'

describe "pages/new" do

   before(:each) do
      @page     = FactoryGirl.create(:page)
      (1..5).each do |num|
          FactoryGirl.create(:section)
      end
      @sections = Section.all
   end
  it "renders new page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pages_path, :method => "post" do
      assert_select "input#page_title", :name => "page[title]"
      assert_select "textarea#page_body", :name => "page[body]"
      assert_select "input#page_published", :name => "page[published]"
      assert_select "input#page_discution", :name => "page[discution]"
    end
  end
end
