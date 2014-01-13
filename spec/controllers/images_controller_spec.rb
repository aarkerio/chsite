# Chipotle Software(c) 2013

require 'spec_helper'
include CarrierWave::Test::Matchers

describe ImagesController do

  login_user  # spec macro

  # This should return the minimal set of attributes required to create a valid
  # Image. 

  let(:valid_attributes) { Fabricate.attributes_for(:page) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ImagesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all images as @images" do
      image = Image.create! valid_attributes 
      self.get('index', {})
      self.response.should be_success
      self.assigns(:images).should_not be_nil
      self.assigns(:images).should eq([image])
    end
  end

  describe "GET show" do
    it "assigns the requested image as @image" do
      image = Image.create( valid_attributes )
      get 'show', id: image
      assigns(:image).should eq(image)
    end
  end

  describe "GET new" do
    it "assigns a new image as @image" do
      get 'new'
      assigns(:image).should be_a_new(Image)
    end
  end

  describe "GET edit" do
    it "assigns the requested image as @image" do
      image = Image.create( valid_attributes )
      self.get('edit', id: image)
      assigns(:image).should eq(image)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Image" do
        expect {
          post('create', {:image => valid_attributes } )
        }.to change(Image, :count).by(1)
      end

      it "assigns a newly created image as @image" do
        post :create, {:image =>  valid_attributes }
        assigns(:image).should be_a(Image)
        assigns(:image).should be_persisted
      end

      it "redirects to the created image" do
        post 'create', {:image =>  valid_attributes }
        response.should redirect_to(Image.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved image as @image" do
        # Trigger the behavior that occurs when invalid params are submitted
        Image.any_instance.stub(:save).and_return(false)
        post 'create', {:image => { "file" => "invalid value" }}
        assigns(:image).should be_a_new(Image)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Image.any_instance.stub(:save).and_return(false)
        post :create, {:image => { "file" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "-- updates the requested image" do
        image = Image.create! valid_attributes 
        # Assuming there are no other images in the database, thi
        # specifies that the Image created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Image.any_instance.should_receive(:update).with({ "tags" => "MyString" })
        put( :update, {:id => image.to_param, :image => { "tags" => "MyString" }} )
      end

      it "assigns the requested image as @image" do
        image = Image.create( valid_attributes )
        put :update, {:id => image.to_param, :image => valid_attributes}
        assigns(:image).should eq(image)
      end

      it "redirects to the image" do
        image = Image.create( valid_attributes )
        put :update, {:id => image.to_param, :image => valid_attributes}
        response.should redirect_to(image)
      end
    end

    describe "with invalid params" do
      it "assigns the image as @image" do
        image = Image.create( valid_attributes )
        # Trigger the behavior that occurs when invalid params are submitted
        Image.any_instance.stub(:save).and_return(false)
        put :update, {:id => image.to_param, :image => { "file" => "i" }}  # invalid value
        assigns(:image).should eq(image)
      end

      it "re-renders the 'edit' template" do
        image = Image.create( valid_attributes )
        # Trigger the behavior that occurs when invalid params are submitted
        Image.any_instance.stub(:save).and_return(false)
        put :update, {:id => image.to_param, :image => { "file" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      image = Image.create( valid_attributes )
      expect {
        delete 'destroy', {:id => image.to_param}
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the images list" do
      image = Image.create( valid_attributes )
      delete 'destroy', {:id => image.to_param}
      response.should redirect_to(images_url)
    end
  end
end
