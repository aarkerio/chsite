require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :file => "MyString",
      :user => "",
      :active => false
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path(@image), :method => "post" do
      assert_select "input#image_file", :name => "image[file]"
      assert_select "input#image_user", :name => "image[user]"
      assert_select "input#image_active", :name => "image[active]"
    end
  end
end
