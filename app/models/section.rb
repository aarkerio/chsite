# Chipotle Software (c) 2013 GPLv3

class Section < ActiveRecord::Base
   #has_many :pages
   belongs_to :user

   # mount the uploader:
   mount_uploader :img, ImgSectionUploader

   validates :img, :presence => true

   validates :description, :presence => true

end
