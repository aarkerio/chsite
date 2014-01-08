# Chipotle Software 2013 (c) GPLv3

class Image < ActiveRecord::Base

  belongs_to :user

  # mount the uploader:
  self.mount_uploader(:file, ImageUploader)

  self.validates(:file, :presence => true)

  self.validates(:user, :presence => true, :on => :create, :associated => true   )

end
