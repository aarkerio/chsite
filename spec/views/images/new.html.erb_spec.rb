require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :file => "MyString",
      :user => "",
      :active => false
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path, :method => "post" do
      assert_select "input#image_file", :name => "image[file]"
      assert_select "input#image_user", :name => "image[user]"
      assert_select "input#image_active", :name => "image[active]"
    end
  end
end
